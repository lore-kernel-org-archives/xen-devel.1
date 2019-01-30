From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12 2/8] amd/ntp: remove assert that
 prevents creating 2M MMIO entries
Date: Wed, 30 Jan 2019 11:36:40 +0100
Message-ID: <20190130103646.53649-3-roger.pau@citrix.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CawQ=QG=citrix.com=prvs=9267fa6dd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gonEv-0001Ke-8x
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 10:37:05 +0000
In-Reply-To: <20190130103646.53649-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGFzc2VydCB3YXMgb3JpZ2luYWxseSBhZGRlZCB0byBtYWtlIHN1cmUgdGhhdCBoaWdoZXIg
b3JkZXIKcmVnaW9ucyAoPiBQQUdFX09SREVSXzRLKSBjb3VsZCBub3QgYmUgdXNlZCB0byBieXBh
c3MgdGhlCm1taW9fcm9fcmFuZ2VzIGNoZWNrIHBlcmZvcm1lZCBieSBwMm1fdHlwZV90b19mbGFn
cy4KClRoaXMgaG93ZXZlciBpcyBhbHJlYWR5IGNoZWNrZWQgaW4gc2V0X21taW9fcDJtX2VudHJ5
LCB3aGljaCBtYWtlcwpzdXJlIHRoYXQgaGlnaGVyIG9yZGVyIG1hcHBpbmdzIGRvbid0IG92ZXJs
YXAgd2l0aCBtbWlvX3JvX3JhbmdlcywKdGh1cyBhbGxvd2luZyB0aGUgY3JlYXRpb24gb2YgaGln
aCBvcmRlciBNTUlPIG1hcHBpbmdzIHNhZmVseS4KClJlbW92ZSB0aGUgYXNzZXJ0IHRvIGFsbG93
IDJNIGVudHJpZXMgdG8gYmUgY3JlYXRlZCBmb3IgTU1JTyByZWdpb25zCnRoYXQgZG9uJ3Qgb3Zl
cmxhcCB3aXRoIG1taW9fcm9fcmFuZ2VzLgoKU3VnZ2VzdGVkLWJ5OiBHZW9yZ2UgRHVubGFwIDxn
ZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgot
LS0KV2l0aG91dCB0aGlzIHBhdGNoIHRyeWluZyB0byBjcmVhdGUgYSBQVkggZG9tMCB3aWxsIHRy
aWdnZXIgYW4gYXNzZXJ0Cm9uIGNlcnRhaW4gaGFyZHdhcmUgZGVwZW5kaW5nIG9uIHRoZSBtZW1v
cnkgbWFwLgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYyB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMg
Yi94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKaW5kZXggMTJmOTJjZjFmMC4uYjg5OTZlNTQxNSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9wMm0tcHQuYwpAQCAtNjY4LDcgKzY2OCw2IEBAIHAybV9wdF9zZXRfZW50cnkoc3RydWN0IHAy
bV9kb21haW4gKnAybSwgZ2ZuX3QgZ2ZuXywgbWZuX3QgbWZuLAogICAgICAgICB9CiAKICAgICAg
ICAgQVNTRVJUKHAybV9mbGFnc190b190eXBlKGZsYWdzKSAhPSBwMm1faW9yZXFfc2VydmVyKTsK
LSAgICAgICAgQVNTRVJUKCFtZm5fdmFsaWQobWZuKSB8fCBwMm10ICE9IHAybV9tbWlvX2RpcmVj
dCk7CiAgICAgICAgIGwyZV9jb250ZW50ID0gbWZuX3ZhbGlkKG1mbikgfHwgcDJtX2FsbG93c19p
bnZhbGlkX21mbihwMm10KQogICAgICAgICAgICAgPyBwMm1fbDJlX2Zyb21fcGZuKG1mbl94KG1m
biksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdG9fZmxhZ3MocDJt
LCBwMm10LCBtZm4sIDEpKQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
