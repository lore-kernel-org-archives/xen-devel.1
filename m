From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 2/2] common/page_alloc: don't idle-scrub
 before microcode update
Date: Tue, 27 Nov 2018 10:10:16 +0000
Message-ID: <9864501a-0d34-8aeb-4550-273a83dd493d@arm.com>
References: <20181127100034.4257-1-sergey.dyasli@citrix.com>
 <20181127100034.4257-3-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181127100034.4257-3-sergey.dyasli@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMS8yNy8xOCAxMDowMCBBTSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBTb21lIHg4
NiBDUFVzIGhhcyBlcnJhdGEgcmVnYXJkaW5nIG1pY3JvY29kZSB1cGRhdGVzLiBUaGUgbW9zdCBu
b3RvcmlvdXMKPiBpcyBCcm9hZHdlbGwncyBCRFg5MDogIkxvYWRpbmcgTWljcm9jb2RlIC4uLiBN
YXkgUmVzdWx0IGluIGEgU3lzdGVtIEhhbmciLgo+IChVUkw6IGh0dHBzOi8vd3d3LmludGVsLmNv
bS9jb250ZW50L2RhbS93d3cvcHVibGljL3VzL2VuL2RvY3VtZW50cy9zcGVjaWZpY2F0aW9uLXVw
ZGF0ZXMveGVvbi1lNy12NC1zcGVjLXVwZGF0ZS5wZGYpCj4gCj4gQ1BVcyBhcmUgc3VwcG9zZWQg
dG8gYmUgaWRsZSBkdXJpbmcgaW5pdGlhbCBtaWNyb2NvZGUgdXBkYXRlLiBJZGxlLXNjcnViCj4g
Y2hhbmdlcyB0aGlzLCBtYWtpbmcgYSBDUFUgdG8gZ28gc2NydWJiaW5nIChtZW1zZXQpIHJpZ2h0
IGFmdGVyIGl0IHdhcwo+IGJyb3VnaHQgdXAuIFRoaXMgY2FuIGdldCBpbiBhIHdheSBvZiBtaWNy
b2NvZGUgdXBkYXRlIGZvciBvdGhlciBDUFVzLAo+IHdoaWNoIHJlc3VsdHMgaW4gYSBzeXN0ZW0g
aGFuZzoKPiAKPiAgICAgIFsgICAgMC4wMDAwMDBdIENQVSBWZW5kb3I6IEludGVsLCBGYW1pbHkg
NiAoMHg2KSwgTW9kZWwgNzEgKDB4NDcpLCBTdGVwcGluZyAxIChyYXcgMDAwNDA2NzEpCj4gICAg
ICAuLi4KPiAgICAgIFsgICAgMi41OTg4MTNdIEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5n
IChIQVApIGRldGVjdGVkCj4gICAgICBbICAgIDIuNjAwMjExXSBIVk06IEhBUCBwYWdlIHNpemVz
OiA0a0IsIDJNQiwgMUdCCj4gICAgICBbICAgIDAuMDAwMDAwXSBtaWNyb2NvZGU6IENQVTIgdXBk
YXRlZCBmcm9tIHJldmlzaW9uIDB4MTEgdG8gMHgxZSwgZGF0ZSA9IDIwMTgtMDQtMDMKPiAgICAg
IFsgICAgMC4wMDAwMDBdIG1pY3JvY29kZTogQ1BVNCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgx
MSB0byAweDFlLCBkwoAIIAgbWzJKG1sxOzFIG1sySgo+IAo+IFByZXZlbnQgdGhpcyBzaXR1YXRp
b24gYnkgZGlzYWJsaW5nIGlkbGUgc2NydWJiaW5nIHVudGlsCj4gU1lTX1NUQVRFX3NtcF9ib290
ZWQgaXMgcmVhY2hlZC4KCkkgYW0gbm90IGF3YXJlIG9mIGFueSBpc3N1ZSBvbiBBcm0gdGhhdCBy
ZXF1aXJlcyBkZWxheWluZyB0aGUgaWRsZSAKc2NydWJiaW5nLiBJdCBpcyBhY3R1YWxseSBwcm9i
YWJseSBiZXR0ZXIgdG8gYXZvaWQgZGVsYXlpbmcgaXQgYXMgaXQgbWF5IAp0YWtlIGEgbG9uZyB0
aW1lIHRvIGJvb3QgYWxsIENQVXMgb24gcGxhdGZvcm0gd2l0aCBhIGhpZ2ggbnVtYmVyIG9mIApj
b3JlcyAoNDggY29yZXMgb3IgdXBwZXIpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
