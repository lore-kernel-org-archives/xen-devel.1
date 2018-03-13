From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 02:03:47 -0600
Message-ID: <5AA793F302000078001B0CC4@prv-mh.provo.novell.com>
References: <20180313044333.27923-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180313044333.27923-1-cardoe@cardoe.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE4IGF0IDA1OjQzLCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IFRo
ZSBjb2RlIGFkZGVkIGluIDdhNDg2MjJhNzhhMGI0NTJlOGFmYTU1Yjg0NDJjOTU4YWJkMjI2YTcg
Y291bGQgdXNlIHJjCj4gdW5pbml0aWFsaXplZCBpbiBtYWluX3ZkaXNwbGF0dGFjaCgpLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPiAtLS0K
PiBDQzogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgo+IC0t
LQo+ICB0b29scy94bC94bF92ZGlzcGwuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpQbGVhc2UgdHJpbSB5b3VyIENjIGxpc3QgLSBJJ3Zl
IHJlbW92ZWQgYWxsIGluZGl2aWR1YWxzIGhlcmUsIGFuZCBJCmRvbid0IHNlZSB3aHkgeW91J3Zl
IGNvcGllZCBhbGwgUkVTVCBtYWludGFpbmVycyB3aGVuIHRoaXMgaXMKY2xlYXJseSBhIHB1cmUg
dG9vbCBzdGFjayBjaGFuZ2UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
