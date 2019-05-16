From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Thu, 16 May 2019 15:28:15 +0100
Message-ID: <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
 <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMTYvMDUvMjAxOSAxNToyNSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBI
ZWxsbyBKdWxpZW4sCj4gCj4gT24gMTYuMDUuMTkgMTY6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gVGhlIGxvY2sgY2FuIGJlIGNvbXBsZXRlbHkgcmVtb3ZlZCBhbnl3YXkuIFNlZSBteSBwcmV2
aW91cyBjb21tZW50cy4KPiAKPiBZb3Ugc3VnZ2VzdGVkIGtpbmRhIHNpbXBsaWZpZWQgdHJ5X2xv
Y2sgd2l0aCBydW5zdGF0ZSB1cGRhdGUgc2tpcHBpbmcgaW4gY2FzZSBvZiAKPiBmYWlsLgo+IFRo
ZSBxdWVzdGlvbiBoZXJlIGlzIGlmIHdlIGFyZSBPSyB3aXRoIG5vdCB1cGRhdGluZyBydW5zdGF0
ZSB1bmRlciBjaXJjdW1zdGFuY2VzPwoKV2VsbCwgaWYgeW91IGZhaWwgdGhlIGNoZWNrIHRoZW4g
aXQgbWVhbnMgc29tZW9uZSB3YXMgbW9kaWZ5aW5nIGl0IGJlaGluZCB5b3VyIApiYWNrLiBUaGF0
IHNvbWVvbmUgY291bGQgdXBkYXRlIHRoZSBydW5zdGF0ZSB3aXRoIHRoZSBuZXcgaW5mb3JtYXRp
b24gb25jZSBpdCBpcyAKbW9kaWZpZWQuIFNvIEkgY2FuJ3Qgc2VlIGlzc3VlIHdpdGggbm90IHVw
ZGF0aW5nIHRoZSBydW5zdGF0ZSBpbiB0aGUgY29udGV4dCBzd2l0Y2guCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
