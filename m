From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/5] PVH MTRR initial state
Date: Thu, 10 May 2018 18:15:00 +0100
Message-ID: <20180510171505.37309-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tie0=h5=citrix.com=prvs=66130e668=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fGpAO-0006qX-2e
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 17:15:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHBhdGNoZXMgc2V0IGEgc2FuZSBpbml0aWFsIE1UUlIgc3Rh
dGUgZm9yIGJvdGggRG9tMCBhbmQKRG9tVSBQVkggZ3Vlc3RzLiBOb3RlIHRoYXQgZm9yIERvbTAg
dGhlIGhvc3QgTVRSUiBzdGF0ZSBpcyB1c2VkLCBPVE9ICmZvciBEb21VIHRoZSBkZWZhdWx0IE1U
UlIgdHlwZSBpcyBzZXQgdG8gd3JpdGUtYmFjay4KClRoaXMgc2hvdWxkIGF2b2lkIGd1ZXN0cyBo
YXZpbmcgdG8gc2V0dXAgc29tZSBraW5kIG9mIE1UUlIgc3RhdGUgaW4Kb3JkZXIgdG8gYm9vdC4K
ClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDUpOgogIGh2bS9tdHJyOiBhZGQgZW1h
Y3MgbG9jYWwgdmFyaWFibGVzIGJsb2NrIHdpdGggZm9ybWF0dGluZyBpbmZvCiAgaHZtL210cnI6
IHVzZSB0aGUgaGFyZHdhcmUgbnVtYmVyIG9mIHZhcmlhYmxlIHJhbmdlcyBmb3IgRG9tMAogIGh2
bS9tdHJyOiBjb3B5IGhhcmR3YXJlIHN0YXRlIGZvciBEb20wCiAgbGlieGMvcHZoOiBzZXQgZGVm
YXVsdCBNVFJSIHR5cGUgdG8gd3JpdGUtYmFjawogIGRvY3MvcHZoOiBkb2N1bWVudCBpbml0aWFs
IE1UUlIgc3RhdGUKCiBkb2NzL21pc2MvcHZoLm1hcmtkb3duICAgfCAxNSArKysrKysrKysrKysr
CiB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2h2bS9tdHJyLmMgIHwgNDYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAxMDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
