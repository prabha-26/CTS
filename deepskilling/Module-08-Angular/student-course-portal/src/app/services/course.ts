import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CourseService {

  getCourses(): Observable<any[]> {

    return of([
      { name: 'Angular', available: true, credits: 3 },
      { name: 'ASP.NET Core', available: true, credits: 4 },
      { name: 'C#', available: false, credits: 2 },
      { name: 'SQL Server', available: true, credits: 1 }
    ]);

  }

}