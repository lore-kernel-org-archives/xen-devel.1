From: "Natarajan, Janakarajan" <jnataraj@amd.com>
Subject: Re: [PATCH 4/8] x86/SVM: Add vcpu scheduling support
 for AVIC
Date: Thu, 19 Apr 2018 10:54:10 -0500
Message-ID: <40d464fb-9ed0-209f-8bbf-45537a3194ec@amd.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5d6f4ad92f0ef62afedbc0a111ec2d4fe8286c43.1522794651.git.Janakarajan.Natarajan@amd.com>
 <47fc298a-02f5-0f30-61e3-c7fdf038337d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <47fc298a-02f5-0f30-61e3-c7fdf038337d@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, xen-devel@lists.xen.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xMy8yMDE4IDEyOjU3IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDA0LzA0LzE4
IDAwOjAxLCBKYW5ha2FyYWphbiBOYXRhcmFqYW4gd3JvdGU6Cj4+IEBAIC02Myw2ICs2NCw1NCBA
QCBhdmljX2dldF9waHlzaWNhbF9pZF9lbnRyeShzdHJ1Y3Qgc3ZtX2RvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGluZGV4KQo+PiAgICAgICByZXR1cm4gJmQtPmF2aWNfcGh5c2ljYWxfaWRfdGFibGVb
aW5kZXhdOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIGF2aWNfdmNwdV9sb2FkKHN0cnVj
dCB2Y3B1ICp2KQo+PiArewo+PiArICAgIHVuc2lnbmVkIGxvbmcgdG1wOwo+PiArICAgIHN0cnVj
dCBhcmNoX3N2bV9zdHJ1Y3QgKnMgPSAmdi0+YXJjaC5odm1fc3ZtOwo+PiArICAgIGludCBoX3Bo
eV9hcGljX2lkOwo+PiArICAgIHN0cnVjdCBhdmljX3BoeXNpY2FsX2lkX2VudHJ5ICplbnRyeSA9
IChzdHJ1Y3QgYXZpY19waHlzaWNhbF9pZF9lbnRyeSAqKSZ0bXA7Cj4+ICsKPj4gKyAgICBBU1NF
UlQoIXRlc3RfYml0KF9WUEZfYmxvY2tlZCwgJnYtPnBhdXNlX2ZsYWdzKSk7Cj4+ICsKPj4gKyAg
ICAvKgo+PiArICAgICAqIE5vdGU6IEFQSUMgSUQgPSAweGZmIGlzIHVzZWQgZm9yIGJyb2FkY2Fz
dC4KPj4gKyAgICAgKiAgICAgICBBUElDIElEID4gMHhmZiBpcyByZXNlcnZlZC4KPj4gKyAgICAg
Ki8KPj4gKyAgICBoX3BoeV9hcGljX2lkID0gY3B1X2RhdGFbdi0+cHJvY2Vzc29yXS5hcGljaWQ7
Cj4+ICsgICAgQVNTRVJUKGhfcGh5X2FwaWNfaWQgPCBBVklDX1BIWV9BUElDX0lEX01BWCk7Cj4+
ICsKPj4gKyAgICB0bXAgPSByZWFkX2F0b21pYygodTY0Kikocy0+YXZpY19sYXN0X3BoeV9pZCkp
Owo+PiArICAgIGVudHJ5LT5ob3N0X3BoeV9hcGljX2lkID0gaF9waHlfYXBpY19pZDsKPj4gKyAg
ICBlbnRyeS0+aXNfcnVubmluZyA9IDE7Cj4+ICsgICAgd3JpdGVfYXRvbWljKCh1NjQqKShzLT5h
dmljX2xhc3RfcGh5X2lkKSwgdG1wKTsKPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHMtPmF2aWNf
bGFzdF9waHlfaWQgPwo+Cj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIGl0IGlzIGFsd2F5cyBhbiB1
bmNoYW5naW5nIHBvaW50ZXIgaW50byB0aGUKPiBwaHlzaWNhbCBJRCB0YWJsZSwgd2hpY2ggaXMg
b25seSBldmVyIHVwZGF0ZWQgc3luY2hyb25vdXNseSBpbiBjdXJyZW50Cj4gY29udGV4dC4KPgo+
IElmIHNvLCBJIGRvbid0IHNlZSB3aHkgaXQgbmVlZHMgYW55IG9mIHRoZXNlIGhvb3BzIHRvIGJl
IGp1bXBlZCB0aG91Z2guCgpzLT5hdmljX2xhc3RfcGh5X2lkIGlzIHVzZWQgdG8gcXVpY2tseSBh
Y2Nlc3MgdGhlIGVudHJ5IGluIHRoZSB0YWJsZS4KCldoZW4gdGhlIGNvZGUgd2FzIHB1c2hlZCBm
b3IgTGludXgsIG1lbW9yeSBiYXJyaWVycyB3ZXJlIHVzZWQgYW5kIGl0IHdhcyAKc3VnZ2VzdGVk
IHRoYXQgYXRvbWljIG9wZXJhdGlvbnMKYmUgdXNlZCBpbnN0ZWFkIHRvIGVuc3VyZSBjb21waWxl
ciBvcmRlcmluZy4gVGhlIHNhbWUgaXMgZG9uZSBoZXJlLgoKPgo+IH5BbmRyZXcKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
