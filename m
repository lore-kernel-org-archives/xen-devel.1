From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] pvcalls-front: Avoid
 __get_free_pages(GFP_KERNEL) under spinlock
Date: Fri, 30 Nov 2018 15:13:04 +0100
Message-ID: <3ae24ccf-d7ce-cfb8-8363-e9eb647bbffe__32853.4294538715$1543587136$gmane$org@suse.com>
References: <20181130110107.31468-1-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tzb=oj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSjXZ-0003zZ-C3
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 14:13:09 +0000
In-Reply-To: <20181130110107.31468-1-wen.yang99@zte.com.cn>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wen Yang <wen.yang99@zte.com.cn>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, zhong.weidong@zte.com.cn, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMTEvMjAxOCAxMjowMSwgV2VuIFlhbmcgd3JvdGU6Cj4gVGhlIHByb2JsZW0gaXMgdGhh
dCB3ZSBjYWxsIHRoaXMgd2l0aCBhIHNwaW4gbG9jayBoZWxkLgo+IFRoZSBjYWxsIHRyZWUgaXM6
Cj4gcHZjYWxsc19mcm9udF9hY2NlcHQoKSBob2xkcyBiZWRhdGEtPnNvY2tldF9sb2NrLgo+ICAg
ICAtPiBjcmVhdGVfYWN0aXZlKCkKPiAgICAgICAgIC0+IF9fZ2V0X2ZyZWVfcGFnZXMoKSB1c2Vz
IEdGUF9LRVJORUwKPiAKPiBUaGUgY3JlYXRlX2FjdGl2ZSgpIGZ1bmN0aW9uIGlzIG9ubHkgY2Fs
bGVkIGZyb20gcHZjYWxsc19mcm9udF9hY2NlcHQoKQo+IHdpdGggYSBzcGluX2xvY2sgaGVsZCwg
VGhlIGFsbG9jYXRpb24gaXMgbm90IGFsbG93ZWQgdG8gc2xlZXAgYW5kCj4gR0ZQX0tFUk5FTCBp
cyBub3Qgc3VmZmljaWVudC4KPiAKPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0
aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KPiAKPiB2MjogQWRkIGEgZnVuY3Rpb24gZG9pbmcgdGhl
IGFsbG9jYXRpb25zIHdoaWNoIGlzIGNhbGxlZAo+ICAgICBvdXRzaWRlIHRoZSBsb2NrIGFuZCBw
YXNzaW5nIHRoZSBhbGxvY2F0ZWQgZGF0YSB0bwo+ICAgICBjcmVhdGVfYWN0aXZlKCkuCj4gdjM6
IFVzZSB0aGUgbWF0Y2hpbmcgZGVhbGxvY2F0b3JzIGkuZS4sIGZyZWVfcGFnZSgpCj4gICAgIGFu
ZCBmcmVlX3BhZ2VzKCksIHJlc3BlY3RpdmVseS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZW4gWWFuZyA8d2VuLnlh
bmc5OUB6dGUuY29tLmNuPgo+IENDOiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2FsbEBsaXA2LmZy
Pgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IEND
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KClRoaXMgcGF0
Y2ggaXMgbWFsZm9ybWVkLiBQbGVhc2Ugc2VuZCBpdCB2aWEgYW4gYXBwcm9wcmlhdGUgdG9vbC9t
YWlsZXIuCgpTZWUgZS5nLiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
LnJzdCBvcgpEb2N1bWVudGF0aW9uL3Byb2Nlc3MvZW1haWwtY2xpZW50cy5yc3QgaW4gdGhlIExp
bnV4IGtlcm5lbCBzb3VyY2UgdHJlZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
