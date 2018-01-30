From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/3] xen/arm: Inject an exception to the guest
	rather than crashing it
Date: Tue, 30 Jan 2018 16:14:30 +0000
Message-ID: <20180130161433.6910-1-julien.grall@arm.com>
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
To: xen-devel@lists.xen.org
Cc: andrew.cooper3@citrix.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzbWFsbCBzZXJpZXMgcmVwbGFjZXMgYWxsIGNhbGwgdG8gZG9tYWluX2Ny
YXNoX3N5bmNocm9ub3VzIGJ5IGluamVjdGluZwphbiBleGNlcHRpb24gdG8gdGhlIGd1ZXN0LgoK
VGhpcyB3aWxsIHJlc3VsdCB0byBhIG5pY2VyIHRyYWNlIGZyb20gdGhlIGd1ZXN0IChubyBuZWVk
IHRvIG1hbnVhbGx5IHdhbGsKdGhlIHN0YWNrKSBhbmQgZ2l2ZSBhIGNoYW5jZSB0byB0aGUgZ3Vl
c3QgdG8gZ2l2ZSBhIGJpdCBtb3JlIGluZm9ybWF0aW9uIG9uCndoYXQgaXQgd2FzIGRvaW5nLgoK
Q2hlZXJzLAoKSnVsaWVuIEdyYWxsICgzKToKICB4ZW4vYXJtOiBpbzogRGlzdGluZ3Vpc2ggdW5o
YW5kbGVkIElPIGZyb20gYWJvcnRlZCBvbmUKICB4ZW4vYXJtOiBEb24ndCBjcmFzaCBkb21haW4g
b24gYmFkIE1NSU8gZW11bGF0aW9uCiAgeGVuL2FybTogRG9uJ3QgY3Jhc2ggdGhlIGRvbWFpbiBv
biBpbnZhbGlkIEhWQyBpbW1lZGlhdGUKCiB4ZW4vYXJjaC9hcm0vaW8uYyAgICAgICAgICB8IDI0
ICsrKysrKysrKysrKystLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICB8IDQ3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNo
L2FybS92Z2ljLXYyLmMgICAgIHwgIDIgLS0KIHhlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jIHwg
IDMgLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy12My5jICAgICB8ICA4IC0tLS0tLS0tCiB4ZW4vYXJj
aC9hcm0vdnBsMDExLmMgICAgICB8ICAyIC0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL21taW8uaCB8
ICA5ICsrKysrKysrLQogNyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA0MiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
