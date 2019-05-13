From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
Date: Mon, 13 May 2019 15:52:32 +0100
Message-ID: <56c37065-b320-0919-2ae8-0156281829cb@arm.com>
References: <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
 <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
 <20190513104336.GA2798@zion.uk.xensource.com>
 <CAOcoXZaLGtpe4DsnQoYynR5iFh43EM5q8pj7fKWJZ=odJy46DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQCJg-0004iI-F5
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:52:36 +0000
In-Reply-To: <CAOcoXZaLGtpe4DsnQoYynR5iFh43EM5q8pj7fKWJZ=odJy46DA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzEzLzE5IDM6MzkgUE0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBIaSBXZWkgYW5k
IEp1bGllbiwKPiAtLS0KPiBYZW4gNC4xMyBoYXMgbm90IGJlZW4gY2hlY2tlZCB5ZXQgd2l0aCB0
aGUgcGF0Y2guIEN1cnJlbnRseSwgeGVuIDQuMTMKPiBzdGFnaW5nIGZhaWxzIHRvIGJvb3QgZHVl
IHRvIHVua25vd24gcmVhc29uLi4uIGl0IHdvcmtlZCBzb21lIGRheXMKPiBhZ28uCj4gSXQgaGFu
Z3MgYWZ0ZXIgdGhlIG5leHQgbG9nIGN1cnJlbnRseToKPiAoWEVOKSBGYWlsZWQgdG8gYnJpbmcg
dXAgQ1BVIDcgKGVycm9yIC01KQo+IChYRU4pIEJyb3VnaHQgdXAgNCBDUFVzCj4gKFhFTikgUDJN
OiA0NC1iaXQgSVBBIHdpdGggNDQtYml0IFBBIGFuZCA4LWJpdCBWTUlECj4gKFhFTikgUDJNOiA0
IGxldmVscyB3aXRoIG9yZGVyLTAgcm9vdCwgVlRDUiAweDgwMDQzNTk0Cj4gKFhFTikgSS9PIHZp
cnR1YWxpc2F0aW9uIGRpc2FibGVkCj4gKFhFTikgYnVpbGQtaWQ6IGY0ZWEyYzkzZmYwOTIyNWJl
ZWQwNWY2MjlhMzgxM2I0ZTMxYzQyMGQKPiAoWEVOKSBhbHRlcm5hdGl2ZXM6IFBhdGNoaW5nIHdp
dGggYWx0IHRhYmxlIDAwMDAwMDAwMDAzNDNkNTggLT4gMDAwMDAwMDAwMDM0NDQxOAoKV2hpY2gg
Y29tbWl0IGFyZSB5b3UgdXNpbmc/IERvIHlvdSByZW1lbWJlciB3aGljaCBvbmUgd29ya2VkPyBJ
ZiBzbywgY2FuIAp5b3UgYmlzZWN0IGl0PwoKPiAtLS0KPiAKPiBKdWxpZW4sIGFyZSB5b3UgZ29p
bmcgdG8gaW50ZWdyYXRlIHRoZSBwYXRjaD8KCkZvciB0aGF0IHNvbWVvbmUgbmVlZHMgdG8gc2Vu
ZCBhIHBhdGNoIHNvIGl0IGNhbiBiZSByZXZpZXdlZC4gSSB3YXMgCmhvcGluZyB5b3UgY291bGQg
ZG8gdGhhdCBhcyB0aGUgcmVwb3J0ZXIgb2YgdGhlIHByb2JsZW0uCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
