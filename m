From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Wed, 13 Jun 2018 13:12:33 +0200
Message-ID: <d1ed4fec-d02f-0f0a-f4c3-ecfb04249613__12049.7527685531$1528888306$gmane$org@suse.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <5B20EC6C02000078001CACBA@prv1-mh.provo.novell.com>
 <5B20EFE102000078001CACD4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qeqh=i7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fT3he-0003G7-JZ
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 11:12:38 +0000
In-Reply-To: <5B20EFE102000078001CACD4@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDYvMTggMTI6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEzLjA2LjE4IGF0
IDEyOjA1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAxMy4wNi4xOCBhdCAx
MTo1OCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBVc2luZyBwcml2Y21kX2NhbGwoKSBm
b3IgYSBzaW5nbGV0b24gbXVsdGljYWxsIHNlZW1zIHRvIGJlIHdyb25nLCBhcwo+Pj4gcHJpdmNt
ZF9jYWxsKCkgaXMgdXNpbmcgc3RhYygpL2NsYWMoKSB0byBlbmFibGUgaHlwZXJ2aXNvciBhY2Nl
c3MgdG8KPj4+IExpbnV4IHVzZXIgc3BhY2UuCj4+Pgo+Pj4gQWRkIGEgbmV3IHhlbl9zaW5nbGVf
Y2FsbCgpIGZ1bmN0aW9uIHRvIGJlIHVzZSBmb3IgdGhhdCBwdXJwb3NlLgo+Pj4KPj4+IFJlcG9y
dGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQWN0dWFsbHkgSSd2ZSBvbmx5IG5vdyBy
ZWFsaXplZCB0aGF0IHRoaXMgaXNuJ3QgYSByZWFsIHByb2JsZW0gcmlnaHQgbm93Ogo+IFBWIGNh
bid0IHVzZSBTTUFQICh3ZSBkb24ndCBwcm92aWRlIGEgdmlydHVhbGl6ZWQgdmVyc2lvbiBvZiBp
dCksIGFuZAo+IEhWTS9QVkggY2FuJ3QgdXNlIG11bHRpY2FsbHMgKHdoaWNoIG1heSBoYXZlIHRv
IGNoYW5nZSBmb3IgUFZIIERvbTAsCj4gc28gaGF2aW5nIHRoZSBjaGFuZ2UgaW4gcGxhY2UgaXMg
aGVscGZ1bCBhbnl3YXkpLCBzbyB0aGUgd2hvbGUKPiBpbi1rZXJuZWwgbG9naWMgdG8gY29sbGVj
dCBhbmQgaXNzdWUgYmF0Y2hlcyBzaG91bGQgYmUgdW5yZWFjaGFibGUgdGhlcmUuCj4gCj4gQnV0
IHBlcmhhcHMgdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxkIGJlbmVmaXQgZnJvbSBhIGxpdHRsZSBi
aXQgb2YKPiByZS13b3JkaW5nLgoKSG1tLCByaWdodC4KCldoYXQgYWJvdXQ6CgoiVXNpbmcgcHJp
dmNtZF9jYWxsKCkgZm9yIGEgc2luZ2xldG9uIG11bHRpY2FsbCBzZWVtcyB0byBiZSB3cm9uZywg
YXMKIHByaXZjbWRfY2FsbCgpIGlzIHVzaW5nIHN0YWMoKS9jbGFjKCkgdG8gZW5hYmxlIGh5cGVy
dmlzb3IgYWNjZXNzIHRvCiBMaW51eCB1c2VyIHNwYWNlLgoKIEV2ZW4gaWYgY3VycmVudGx5IG5v
dCBhIHByb2JsZW0gKHB2IGRvbWFpbnMgY2FuJ3QgdXNlIFNNQVAgd2hpbGUgSFZNCiBhbmQgUFZI
IGRvbWFpbnMgY2FuJ3QgdXNlIG11bHRpY2FsbHMpIHRoaW5ncyBtaWdodCBjaGFuZ2Ugd2hlbgog
UFZIIGRvbTAgc3VwcG9ydCBpcyBhZGRlZCB0byB0aGUga2VybmVsLiIKCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
