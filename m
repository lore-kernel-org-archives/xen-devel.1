From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 17 Oct 2018 10:43:36 +0300
Message-ID: <3904d8a7-6bd3-7560-1926-3f51e0f2b0a3@bitdefender.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
 <934c92cb-7b8e-d1b3-18e9-721ab6623dc2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rnu4=m5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gCgUX-0005Iu-Jt
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 07:43:41 +0000
In-Reply-To: <934c92cb-7b8e-d1b3-18e9-721ab6623dc2@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTYvMTggNzoyNiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwOS8yNy8yMDE4
IDA4OjU4IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGVyZSBpcyBh
IHN1Ym9wIGZvciBzZXR0aW5nIHRoZSBtZW1hY2Nlc3Mgb2YgYSBwYWdlLCBidXQgbm90Cj4+IGZv
ciBjb25zdWx0aW5nIGl0LiAgVGhlIG5ldyBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3MgYWRk
cyB0aGlzCj4+IGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IEJvdGggYWx0cDJtIGdldC9zZXQgbWVtIGFj
Y2VzcyBmdW5jdGlvbnMgdXNlIHRoZSBzdHJ1Y3QKPj4geGVuX2h2bV9hbHRwMm1fbWVtX2FjY2Vz
cyB3aGljaCBoYXMgbm93IGRyb3BwZWQgdGhlIGBzZXQnIHBhcnQgYW5kIGhhcwo+PiBiZWVuIHJl
bmFtZWQgZnJvbSB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzcy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiAKPiBTb3JyeSBp
dCB0b29rIHNvIGxvbmcgdG8gZ2V0IHRvIHRoaXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCk5vIHByb2JsZW0gYXQgYWxsLiBUaGFu
a3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
