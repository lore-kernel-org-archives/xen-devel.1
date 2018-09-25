From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH net 0/3 RESEND] xen-netback: hash mapping
 handling adjustments
Date: Tue, 25 Sep 2018 02:11:33 -0600
Message-ID: <5BA9EDB502000078001EB724__44833.2311738797$1537863045$gmane$org@prv1-mh.provo.novell.com>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=u73d=mh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g4iRZ-0002Ci-4y
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 08:11:41 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

KHJlLXNlbmQganVzdCB0byBzYXRpc2Z5IHRoZSBhcHBhcmVudCBuZWVkIGZvciAibmV0IiBpbnNp
ZGUgdGhlIHNxdWFyZSBicmFja2V0cykKCkZpcnN0IGFuZCBmb3JlbW9zdCB0aGUgZml4IGZvciBY
U0EtMjcwLiBPbiB0b3Agb2YgdGhhdCBmdXJ0aGVyIGNoYW5nZXMKd2hpY2ggbG9va2VkIGRlc2ly
YWJsZSB0byBtZSB3aGlsZSBpbnZlc3RpZ2F0aW5nIHRoYXQgWFNBLgoKMTogZml4IGlucHV0IHZh
bGlkYXRpb24gaW4geGVudmlmX3NldF9oYXNoX21hcHBpbmcoKQoyOiB2YWxpZGF0ZSBxdWV1ZSBu
dW1iZXJzIGluIHhlbnZpZl9zZXRfaGFzaF9tYXBwaW5nKCkKMzogaGFuZGxlIHBhZ2Ugc3RyYWRk
bGluZyBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
