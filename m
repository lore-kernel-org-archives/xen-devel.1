From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12] x86/dom0: propagate PVH vlapic EOIs to
 hardware
Date: Wed, 27 Feb 2019 12:51:56 +0100
Message-ID: <20190227115156.54031-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0fFX=RC=citrix.com=prvs=954e75155=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gyxkx-0004wX-29
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 11:52:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudCBjaGVjayBmb3IgTVNJIEVJTyBpcyBtaXNzaW5nIGEgc3BlY2lhbCBjYXNlIGZvciBQ
VkggRG9tMCwKd2hpY2ggZG9lc24ndCBoYXZlIGEgaHZtX2lycV9kcGNpIHN0cnVjdCBidXQgcmVx
dWlyZXMgRUlPcyB0byBiZQpmb3J3YXJkZWQgdG8gdGhlIHBoeXNpY2FsIGxhcGljIGZvciBwYXNz
ZWQtdGhyb3VnaCBkZXZpY2VzLgoKQWRkIGEgc2hvcnQtY2lyY3VpdCB0byBhbGxvdyBFT0lzIGZy
b20gUFZIIERvbTAgdG8gYmUgcHJvcGFnYXRlZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pby5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwppbmRleCBhNmViOGE0MzM2
Li40MjkwYzdjNzEwIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCisr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKQEAgLTg2OSw3ICs4NjksOCBAQCBzdGF0
aWMgaW50IF9odm1fZHBjaV9tc2lfZW9pKHN0cnVjdCBkb21haW4gKmQsCiAKIHZvaWQgaHZtX2Rw
Y2lfbXNpX2VvaShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgdmVjdG9yKQogewotICAgIGlmICggIWlv
bW11X2VuYWJsZWQgfHwgIWh2bV9kb21haW5faXJxKGQpLT5kcGNpICkKKyAgICBpZiAoICFpb21t
dV9lbmFibGVkIHx8CisgICAgICAgICAoIWh2bV9kb21haW5faXJxKGQpLT5kcGNpICYmICFpc19o
YXJkd2FyZV9kb21haW4oZCkpICkKICAgICAgICByZXR1cm47CiAKICAgICBzcGluX2xvY2soJmQt
PmV2ZW50X2xvY2spOwotLSAKMi4xNy4yIChBcHBsZSBHaXQtMTEzKQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
