From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] x86/mm: Use mfn_eq()/mfn_add() rather
 than opencoded variations
Date: Fri, 17 Aug 2018 06:54:46 -0600
Message-ID: <5B76C59602000078001DF6C1@prv1-mh.provo.novell.com>
References: <1534358077-24700-1-git-send-email-andrew.cooper3@citrix.com>
 <1534358077-24700-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534358077-24700-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA4LjE4IGF0IDIwOjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMKPiBAQCAtNzI5LDcgKzcyOSw4IEBAIGhhcF93cml0ZV9wMm1fZW50cnko
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4sIGwxX3BnZW50cnlfdCAqcCwKPiAg
ICAgICAgICAgKiB1bmxlc3MgdGhlIG9ubHkgY2hhbmdlIGlzIGFuIGluY3JlYXNlIGluIGFjY2Vz
cyByaWdodHMuICovCj4gICAgICAgICAgbWZuX3Qgb21mbiA9IGwxZV9nZXRfbWZuKCpwKTsKPiAg
ICAgICAgICBtZm5fdCBubWZuID0gbDFlX2dldF9tZm4obmV3KTsKPiAtICAgICAgICBmbHVzaF9u
ZXN0ZWRwMm0gPSAhKCBtZm5feChvbWZuKSA9PSBtZm5feChubWZuKQo+ICsKPiArICAgICAgICBm
bHVzaF9uZXN0ZWRwMm0gPSAhKG1mbl9lcShvbWZuLCBubWZuKQo+ICAgICAgICAgICAgICAmJiBw
ZXJtc19zdHJpY3RseV9pbmNyZWFzZWQob2xkX2ZsYWdzLCBsMWVfZ2V0X2ZsYWdzKG5ldykpICk7
CgpTZWVpbmcgdGhhdCB5b3Ugc3RyaXAgdGhlIHN0cmF5IGxlYWRpbmcgc3BhY2UsIGNvdWxkIHlv
dSBzdHJpcCB0aGUgc3RyYXkKdHJhaWxpbmcgb25lIGFzIHdlbGwsIGFuZCBtb3ZlIHRoZSAmJiB0
byBpdHMgcHJvcGVyIHBsYWNlPwoKV2l0aCB0aGUgb25lIHByZXZpb3VzbHkgcG9pbnRlZCBvdXQg
aXNzdWUgZml4ZWQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
