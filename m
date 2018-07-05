From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 18:02:30 +0100
Message-ID: <23358.20262.278645.448005@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
 <341794021.20180705174025@eikelenboom.it>
 <23358.17933.141197.826134@mariner.uk.xensource.com>
 <FB11B977-C6B6-4A82-BB05-00D5F701D67B@citrix.com>
 <d5942e06-98cc-63dc-549c-dd3e471ca125@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb7eN-0002IE-K5
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:02:35 +0000
In-Reply-To: <d5942e06-98cc-63dc-549c-dd3e471ca125@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBY
ZW5SVCwgd2hpY2ggaXMgWGVuU2VydmVycyBwcm92aXNpb25pbmcgYW5kIHRlc3Rpbmcgc3lzdGVt
IGFuZCBpbnN0YWxsLAo+IGNhbiBkZXBsb3kgYXJiaXRyYXJ5IGJ1aWxkcyBvZiBYZW5TZXJ2ZXIs
IG9yIGFyYml0cmFyeSBidWlsZHMgb2YgdmFyaW91cwo+IExpbnV4IGRpc3Ryb3MgaW4gMTAgbWlu
dXRlcyAoYWx0aG91Z2ggZm9yIGRpc3Ryb3MsIHdlIGxpbWl0IG91ciBpbnN0YWxsCj4gbWVkaWEg
dG8gcHVibGlzaGVkIHBvaW50IHJlbGVhc2VzKS7CoCBHb29nbGUgIjEwIG1pbnV0ZXMgdG8gWGVu
IiBmb3Igc29tZQo+IFBSIG9uIHRoaXMgc3ViamVjdCBkb25lIGJhY2sgaW4gdGhlIGRheSEKCm9z
c3Rlc3QncyBkLWkgcnVucyB0YWtlIG1vcmUgbGlrZSAxNSBtaW51dGVzLiAgQXMgSSBzYXksIHRo
aXMgY291bGQgYmUKaW1wcm92ZWQgYnkgdXNpbmcgc29tZXRoaW5nIGxpa2UgRkFJLCBidXQgYnkg
YSBmYWN0b3Igb2YgYXQgbW9zdCAyIEkKdGhpbmsuICBJbnN0ZWFkIG9mIHdvcmtpbmcgb24gdGhh
dCwgSSBoYXZlIGJlZW4gd29ya2luZyBvbiByZXVzaW5nIGFuCmluc3RhbGwgd2hlbiBpdCBpcyBm
ZWFzaWJsZSB0byBkbyBzbzogc3BlY2lmaWNhbGx5LCBhZnRlciBhIHBhc3NpbmcKam9iIGFuZCB3
aGVuIHRoZSBob3N0IGlzIHRvIGJlIHJldXNlZCBieSB0aGUgc2FtZSBmbGlnaHQsIHdpdGggYW4K
aWRlbnRpY2FsIGNvbmZpZ3VyYXRpb24uICBJbiBteSB0ZXN0cyB0aGF0IHNhdmVzIGFib3V0IDUw
JSBvZiB0aGUgaG9zdAppbnN0YWxscy4gIEkgaGF2ZW4ndCB5ZXQgY29tcGxldGVkIGFuZCBkZXBs
b3llZCB0aGlzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
