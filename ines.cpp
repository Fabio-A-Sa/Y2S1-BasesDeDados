void readAirports(Company &company, string name_file) {

    ifstream i_file_airport;
    i_file_airport.open(name_file);

    if (i_file_airport.is_open()){

        while (!i_file_airport.eof()) {
            
            // Trata da primeira linha -> separa a o nome da cidade
            string name, city;
            getline(i_file_airport, name, ';'); cout << "Name: " << name << endl;
            getline(i_file_airport, city); cout << "City: " << city << endl;

            // Trata da segunda linha -> separa os 3 números
            string s_n, s_c, s_m;
            getline(i_file_airport, s_n, ';');
            getline(i_file_airport, s_c, ';');
            getline(i_file_airport, s_m);
            int n=stoi(s_n);
            int c=stoi(s_c);
            int m=stoi(s_m);
            cout << "N1: " << n << " N2: " << c << " N3: " << m << endl;

            // Constroi o objecto
            Airport a(name, city, n, c, m);

            // Lê a terceira linha completa
            while (getline(i_file_airport, transport, '-')) { // separa pelos '-'
                stringstream t(transport);
                string name, type, distance, hour;
                t >> name >> type >> distance >> hour;
                float d = stof(distance);
                cout << "Nome: " << name << " type: " << type << " distance: " << d << " all hours: " << hour << endl;

                vector<string> hours;
                while (getline(t, hour, ';')) {         //um transporte pode ter muitos horários
                    hours.push_back(hour);
                }

                TTLocation ttl(name, type, d, hours);
                a.addLocation(ttl);
            }
            company.addAirport(a);
        }
    }
    i_file_airport.close();
}