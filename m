From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/monitor: More generic livelock avoidance
Date: Tue, 23 Oct 2018 15:35:21 +0100
Message-ID: <1540305323-31554-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBhbm90aGVyIHNwbGl0LW91dCBwYXJ0IG9mIG9mIHRoZSB2MSBkZWJ1Z2dpbmcgc2Vy
aWVzLiAgSXQgaXMgc2VtaS1SRkMKYXMgaXQgYXMgb25seSBoYWQgZXh0cmVtZWx5IGxpZ2h0IHRl
c3RpbmcuCgpBbmRyZXcgQ29vcGVyICgyKToKICB4ODYvbW9uaXRvcjogSW50cm9kdWNlIGEgYm9v
bGVhbiB0byBzdXBwcmVzcyBuZXN0ZWQgbW9uaXRvcmluZyBldmVudHMKICB4ODYvaHZtOiBEcm9w
IHRoZSBtYXlfZGVmZXIgYm9vbGVhbiBmcm9tIGh2bV8qIGhlbHBlcnMKCiB4ZW4vYXJjaC94ODYv
aHZtL2VtdWxhdGUuYyAgICAgICAgfCAgOCArKysrLS0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0u
YyAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL21vbml0b3IuYyAgICAgICAgfCAyNCArKysrKysrKysrKysrKysr
KysrKysrLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jICB8IDE0ICsrKysrKyst
LS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgfCAgMiArLQogeGVuL2Fy
Y2gveDg2L2h2bS92bV9ldmVudC5jICAgICAgIHwgIDkgKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYyAgICAgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9z
dXBwb3J0LmggfCAgOCArKysrLS0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAg
IHwgIDggKysrKysrKysKIDEwIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDQ5IGRl
bGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
