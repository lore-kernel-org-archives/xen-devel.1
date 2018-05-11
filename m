From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fix for 4.17-rc5
Date: Fri, 11 May 2018 12:57:01 +0200
Message-ID: <20180511105701.22827-1-jgross__47318.4260460131$1526036145$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ul6o=h6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fH5jV-0002py-6Z
 for xen-devel@lists.xenproject.org; Fri, 11 May 2018 10:57:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjE3LXJjNS10YWcKCnhlbjogZml4IGZvciA0LjE3LXJjNQoKSXQgY29udGFpbnMgb25lIGZpeCBm
b3IgdGhlIGtlcm5lbCBydW5uaW5nIGFzIGEgZnVsbHkgdmlydHVhbGl6ZWQKZ3Vlc3QgdXNpbmcg
UFYgZHJpdmVycyBvbiBvbGQgWGVuIGh5cGVydmlzb3IgdmVyc2lvbnMuCgoKVGhhbmtzLgoKSnVl
cmdlbgoKIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgfCAxMyArKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKSnVlcmdlbiBHcm9zcyAoMSk6CiAgICAg
IE1lcmdlIHRhZyAnZm9yLWxpbnVzLTQuMTctcmM1LXRhZycgb2YgZ2l0b2xpdGUua2VybmVsLm9y
ZzpwdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVuL3RpcCBpbnRvIF9fZm9yLWxpbnVzLTQuMTct
cmM1LXRhZwoKdmFuIGRlciBMaW5kZW4sIEZyYW5rICgxKToKICAgICAgeDg2L3hlbjogUmVzZXQg
VkNQVTAgaW5mbyBwb2ludGVyIGFmdGVyIHNoYXJlZF9pbmZvIHJlbWFwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
