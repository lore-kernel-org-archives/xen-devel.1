From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/6] PVH MTRR initial stat
Date: Tue, 15 May 2018 15:36:11 +0100
Message-ID: <20180515143617.69711-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zhs+=ic=citrix.com=prvs=666baa678=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIb3x-0005iq-9D
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:36:25 +0000
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
ClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUgTW9ubmUgKDYpOgogIGh2bS9tdHJyOiBhZGQgZW1h
Y3MgbG9jYWwgdmFyaWFibGVzIGJsb2NrIHdpdGggZm9ybWF0dGluZyBpbmZvCiAgbXRycjogaW50
cm9kdWNlIG1hc2sgdG8gZ2V0IFZDTlQgZnJvbSBNVFJSY2FwIE1TUgogIGh2bS9tdHJyOiB1c2Ug
dGhlIGhhcmR3YXJlIG51bWJlciBvZiB2YXJpYWJsZSByYW5nZXMgZm9yIERvbTAKICBodm0vbXRy
cjogY29weSBoYXJkd2FyZSBzdGF0ZSBmb3IgRG9tMAogIGxpYnhjL3B2aDogc2V0IGRlZmF1bHQg
TVRSUiB0eXBlIHRvIHdyaXRlLWJhY2sKICBkb2NzL3B2aDogZG9jdW1lbnQgaW5pdGlhbCBNVFJS
IHN0YXRlCgogZG9jcy9taXNjL3B2aC5tYXJrZG93biAgICAgICAgICB8IDE4ICsrKysrKysrCiB0
b29scy9saWJ4Yy94Y19kb21feDg2LmMgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysK
IHhlbi9hcmNoL3g4Ni9jcHUvbXRyci9tYWluLmMgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2
bS9odm0uYyAgICAgICAgICB8ICA3ICsrKy0KIHhlbi9hcmNoL3g4Ni9odm0vbXRyci5jICAgICAg
ICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvbXNyLWluZGV4LmggfCAgNCArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tdHJyLmggICAg
ICB8ICAyICsKIDcgZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKLS0gCjIuMTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
