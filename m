From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/12] scripts/get_maintainer.pl: Print
 proper error message for missing $file
Date: Tue, 13 Mar 2018 16:11:31 +0100
Message-ID: <b200dee9-bbdb-8c4b-7604-d9b6d566ea5d@redhat.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-13-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cefs=gd=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1evlaW-00056N-SM
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:11:40 +0000
In-Reply-To: <1520535787-6223-13-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMjAxOCAyMDowMywgSWFuIEphY2tzb24gd3JvdGU6Cj4gSWYgeW91IHBhc3Mgc2Ny
aXB0cy9nZXRfbWFpbnRhaW5lci5wbCB0aGUgbmFtZSBvZiBhIEZJRk8gb3Igb3RoZXIKPiBleGNp
dGluZyBvYmplY3QgKC9kZXYvc3RkaW4sIGZvciBleGFtcGxlKSwgaXQgd291bGQgZmFsc2VseSBw
cmludAo+ICJmaWxlIG5vdCBmb3VuZCIuICBJbnN0ZWFkOiBzdGF0IHRoZSBvYmplY3QgcmF0aGVy
IHRoYW4gdXNpbmcgLWYgc28KPiB0aGF0IHdlIGRvIG5vdCBtaW5kIGlmIHRoZSBvYmplY3QgaXMg
bm90IGEgZmlsZTsgYW5kIHByaW50IHRoZSBlcnJubwo+IHZhbHVlIGluIHRoZSBlcnJvciBtZXNz
YWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRy
aXguY29tPgo+IENDOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KPiBDQzogUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KPiAtLS0KPiB2NjogTmV3IHBhdGNoIGluIHRoaXMgdmVyc2lvbiBvZiB0
aGUgc2VyaWVzCj4gLS0tCj4gIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGwKPiBpbmRleCAwNzM2OWFhLi40M2ZiNWY1IDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvZ2V0
X21haW50YWluZXIucGwKPiArKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCj4gQEAgLTM4
MSw4ICszODEsOCBAQCBmb3JlYWNoIG15ICRmaWxlIChAQVJHVikgewo+ICAJIyNpZiAkZmlsZSBp
cyBhIGRpcmVjdG9yeSBhbmQgaXQgbGFja3MgYSB0cmFpbGluZyBzbGFzaCwgYWRkIG9uZQo+ICAJ
aWYgKCgtZCAkZmlsZSkpIHsKPiAgCSAgICAkZmlsZSA9fiBzQChbXi9dKSRAJDEvQDsKPiAtCX0g
ZWxzaWYgKCEoLWYgJGZpbGUpKSB7Cj4gLQkgICAgZGllICIkUDogZmlsZSAnJHtmaWxlfScgbm90
IGZvdW5kXG4iOwo+ICsJfSBlbHNpZiAoIShzdGF0ICRmaWxlKSkgewo+ICsJICAgIGRpZSAiJFA6
IGZpbGUgJyR7ZmlsZX0nIG5vdCBmb3VuZDogJCFcbiI7Cj4gIAl9Cj4gICAgICB9Cj4gICAgICBp
ZiAoJGZyb21fZmlsZW5hbWUpIHsKPiAKClF1ZXVlZCwgdGhhbmtzLgoKUGFvbG8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
