From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] common/gnttab: Process softirqs while dumping
 grant tables
Date: Fri, 5 Apr 2019 17:33:10 +0100
Message-ID: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T1NTVGVzdHMgdXBncmFkZSB0byBKZXNzaWUgaGFzIGlkZW50aWZpZWQgdGhhdCB3aXRoIGEgc3Vm
ZmljaWVudGx5IGxhcmdlIGdyYW50CnRhYmxlLCBhIHdhdGNoZG9nIHRpbWVvdXQgY2FuIG9jY3Vy
LgoKaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNDM5
OS90ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC1zaGFkb3cvc2VyaWFs
LWNoYXJkb25uYXkwLmxvZwoKUmVwb3J0ZWQtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRl
eCA4MDcyOGVhLi4zNDRiM2VlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
KysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC0zOTU2LDYgKzM5NTYsOSBAQCBzdGF0
aWMgdm9pZCBnbnR0YWJfdXNhZ2VfcHJpbnQoc3RydWN0IGRvbWFpbiAqcmQpCiAgICAgICAgIHVp
bnQxNl90IHN0YXR1czsKICAgICAgICAgdWludDY0X3QgZnJhbWU7CiAKKyAgICAgICAgaWYgKCAh
KHJlZiAmIDMxKSApCisgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsKKwog
ICAgICAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShndCwgcmVmKTsKICAgICAgICAgaWYg
KCAhYWN0LT5waW4gKQogICAgICAgICB7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
