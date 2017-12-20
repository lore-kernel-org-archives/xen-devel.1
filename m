From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 05/16 RESEND] rbtree: adjust root color
 in rb_insert_color() only when necessary
Date: Wed, 20 Dec 2017 09:51:06 -0700
Message-ID: <5A3AA30A0200007800198EC4@prv-mh.provo.novell.com>
References: <20171121152009.15591-1-kpraveen.lkml@gmail.com>
 <20171121152009.15591-6-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171121152009.15591-6-kpraveen.lkml@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, dario.faggioli@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE3IGF0IDE2OjE5LCA8a3ByYXZlZW4ubGttbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29vZ2xlLmNvbT4KPiAKPiBUaGUg
cm9vdCBub2RlIG9mIGFuIHJidHJlZSBtdXN0IGFsd2F5cyBiZSBibGFjay4gIEhvd2V2ZXIsCj4g
cmJfaW5zZXJ0X2NvbG9yKCkgb25seSBuZWVkcyB0byBtYWludGFpbiB0aGlzIGludmFyaWFudCB3
aGVuIGl0IGhhcyBiZWVuCj4gYnJva2VuIC0gdGhhdCBpcywgd2hlbiBpdCBleGl0cyB0aGUgbG9v
cCBkdWUgdG8gdGhlIGN1cnJlbnQgKHJlZCkgbm9kZQo+IGJlaW5nIHRoZSByb290LiAgSW4gYWxs
IG90aGVyIGNhc2VzIChleGl0aW5nIGFmdGVyIHRyZWUgcm90YXRpb25zLCBvcgo+IGV4aXRpbmcg
ZHVlIHRvIGFuIGV4aXN0aW5nIGJsYWNrIHBhcmVudCkgdGhlIGludmFyaWFudCBpcyBhbHJlYWR5
Cj4gc2F0aXNmaWVkLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGFkanVzdCB0aGUgcm9vdCBub2Rl
IGNvbG9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxrZW5AZ29v
Z2xlLmNvbT4KPiBDYzogQW5kcmVhIEFyY2FuZ2VsaSA8YWFyY2FuZ2VAcmVkaGF0LmNvbT4KPiBB
Y2tlZC1ieTogRGF2aWQgV29vZGhvdXNlIDxEYXZpZC5Xb29kaG91c2VAaW50ZWwuY29tPgo+IENj
OiBSaWsgdmFuIFJpZWwgPHJpZWxAcmVkaGF0LmNvbT4KPiBDYzogUGV0ZXIgWmlqbHN0cmEgPGEu
cC56aWpsc3RyYUBjaGVsbG8ubmw+Cj4gQ2M6IERhbmllbCBTYW50b3MgPGRhbmllbC5zYW50b3NA
cG9ib3guY29tPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4gQ2M6ICJFcmlj
IFcuIEJpZWRlcm1hbiIgPGViaWVkZXJtQHhtaXNzaW9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBbTGludXgg
Y29tbWl0IDZkNTg0NTJkYzA2NmRiNjFhY2RmZjdiODQ2NzFkYjFiMTFhM2RlMWNdCj4gCj4gUG9y
dGVkIHRvIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVuIEt1bWFyIDxrcHJhdmVlbi5s
a21sQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
