From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/altp2m: cleanup p2m_altp2m_lazy_copy
Date: Fri, 12 Apr 2019 11:18:59 -0600
Message-ID: <CABfawh=_FovNs5L7jVF3SEgvOAqg1K9sFkRCY_fYsLFayOKZnQ@mail.gmail.com>
References: <20190412163932.2087-1-tamas@tklengyel.com>
 <cf39f8c3-fd03-9be1-c5e8-94bde833f829@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flRE=SO=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEzqS-0001cn-UP
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 17:20:08 +0000
Received: by mail-wm1-f52.google.com with SMTP id o25so12150160wmf.5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2019 10:19:37 -0700 (PDT)
In-Reply-To: <cf39f8c3-fd03-9be1-c5e8-94bde833f829@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTA6NDggQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8wNC8yMDE5IDE3OjM5LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBUaGUgcDJtX2FsdHAybV9sYXp5X2NvcHkgaXMgcmVzcG9uc2li
bGUgZm9yIGxhemlseSBwb3B1bGF0aW5nIGFuIGFsdHAybSB2aWV3Cj4gPiB3aGVuIHRoZSBndWVz
dCB0cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBiZWluZyBwcmVzZW50IGluIHRoZSBhY3Rp
dmUgdmlldy4KPiA+IEN1cnJlbnRseSB0aGUgZnVuY3Rpb24gdG9vayBzZXZlcmFsIGlucHV0cyB0
aGF0IGl0IGRpZG4ndCB1c2UgYW5kIGFsc28KPiA+IGxvY2tlZC91bmxvY2tlZCBnZm5zIHdoZW4g
aXQgZGlkbid0IG5lZWQgdG8uCj4KPiBJJ3ZlIGdvdCBhIHNlcmllcywgIltQQVRDSCAwMC8xNF0g
WFNBLTI3NyBmb2xsb3d1cCIgd2hpY2ggaXMgc3RpbGwKPiB3YWl0aW5nIGZvciBtbSByZXZpZXcs
IHdoaWNoIGNsZWFucyBzb21lIG9mIHRoaXMgdXAsIGJ1dCBjYW1lIHRvIGEKPiBkaWZmZXJlbnQg
Y29uY2x1c2lvbiBhYm91dCB0aGUgbG9ja2luZyBzYWZldHkgb2YgdGhlIEdGTnMuCj4KPiBTcGVj
aWZpY2FsbHksCj4KPiBbUEFUQ0ggMDQvMTRdIHg4Ni9wMm06IEZpeCBsb2NraW5nIGluIHAybV9h
bHRwMm1fbGF6eV9jb3B5KCkKPgo+IChhbmQgc29tZSBvdGhlciBjbGVhbnVwIGNoYW5nZXMgaW4g
cGF0Y2ggNSBhbmQgNikgd2hpY2ggZXh0ZW5kcyB0aGUKPiBkdXJhdGlvbiBvZiB0aGUgZ2ZuIGxv
Y2tzLgoKVGhhbmtzLCBJIHJlbWVtYmVyIHNlZWluZyB0aGF0IGJ1dCBJIHRoaW5rIG15IGFwcHJv
YWNoIGhlcmUgaXMgbW9yZQpzdHJhaWdodCBmb3J3YXJkLiBUaGUgY2FsbGVyIG9mIHRoaXMgZnVu
Y3Rpb24gYWxyZWFkeSBoYXMgYWxsIHRoZSBpbmZvCmdhdGhlcmVkIGZyb20gdGhlIGhvc3RwMm0g
KGFuZCBob2xkcyB0aGUgbG9jaykgdGhpcyBmdW5jdGlvbiBuZWVkcywgc28Kbm8gbmVlZCB0byBk
dXBsaWNhdGUgdGhhdCB3aXRoaW4gdGhlIGZ1bmN0aW9uLiBBZGRpdGlvbmFsbHkgZ2V0dGluZwp0
aGUgcDJtX2xvY2sgZm9yIHRoZSBhbHRwMm0gd2hpbGUgYWxzbyBob2xkaW5nIGEgZ2ZuIGxvY2sg
ZnJvbSB0aGUKYWx0cDJtIHNlZW1zIHRvIG1lIGxpa2UgaXQncyBub3QgcmVhbGx5IGFjY29tcGxp
c2hpbmcgYW55dGhpbmcgc2luY2UKdGhlIGdmbl9sb2NrIGlzIHJlYWxseSBqdXN0IHAybV9sb2Nr
IGluIGRpc2d1aXNlLiBTbyBsZXQncyBqdXN0IGdldAp0aGUgcDJtX2xvY2sgb25jZSBhbmQgYmUg
ZG9uZSB3aXRoIGl0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
