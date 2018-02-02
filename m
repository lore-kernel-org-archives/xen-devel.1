From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 0/4] xen/arm: Inject an exception to the
 guest rather than crashing it
Date: Fri, 2 Feb 2018 14:48:15 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802021448070.10160@sstabellini-ThinkPad-X260>
References: <20180202101444.3510-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180202101444.3510-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: andrew.cooper3@citrix.com, sstabellini@kernel.org, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0dGVkLCB0aGFua3MKCk9uIEZyaSwgMiBGZWIgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+IEhpIGFsbCwKPiAKPiBUaGlzIHNtYWxsIHNlcmllcyByZXBsYWNlcyBhbGwgY2FsbCB0byBk
b21haW5fY3Jhc2hfc3luY2hyb25vdXMgYnkgaW5qZWN0aW5nCj4gYW4gZXhjZXB0aW9uIHRvIHRo
ZSBndWVzdC4KPiAKPiBUaGlzIHdpbGwgcmVzdWx0IHRvIGEgbmljZXIgdHJhY2UgZnJvbSB0aGUg
Z3Vlc3QgKG5vIG5lZWQgdG8gbWFudWFsbHkgd2Fsawo+IHRoZSBzdGFjaykgYW5kIGdpdmUgYSBj
aGFuY2UgdG8gdGhlIGd1ZXN0IHRvIGdpdmUgYSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBvbgo+IHdo
YXQgaXQgd2FzIGRvaW5nLgo+IAo+IENoZWVycywKPiAKPiBKdWxpZW4gR3JhbGwgKDQpOgo+ICAg
eGVuL2FybTogdHJhcHM6IE1lcmdlIHRyeV9oYW5kbGVfbW1pbygpIGFuZCBoYW5kbGVfbW1pbygp
Cj4gICB4ZW4vYXJtOiBpbzogRGlzdGluZ3Vpc2ggdW5oYW5kbGVkIElPIGZyb20gYWJvcnRlZCBv
bmUKPiAgIHhlbi9hcm06IERvbid0IGNyYXNoIGRvbWFpbiBvbiBiYWQgTU1JTyBlbXVsYXRpb24K
PiAgIHhlbi9hcm06IERvbid0IGNyYXNoIHRoZSBkb21haW4gb24gaW52YWxpZCBIVkMgaW1tZWRp
YXRlCj4gCj4gIHhlbi9hcmNoL2FybS9pby5jICAgICAgICAgIHwgNjUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAg
fCA3MiArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhl
bi9hcmNoL2FybS92Z2ljLXYyLmMgICAgIHwgIDIgLS0KPiAgeGVuL2FyY2gvYXJtL3ZnaWMtdjMt
aXRzLmMgfCAgMyAtLQo+ICB4ZW4vYXJjaC9hcm0vdmdpYy12My5jICAgICB8ICA4IC0tLS0tLQo+
ICB4ZW4vYXJjaC9hcm0vdnBsMDExLmMgICAgICB8ICAyIC0tCj4gIHhlbi9pbmNsdWRlL2FzbS1h
cm0vbW1pby5oIHwgMTEgKysrKysrLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMo
KyksIDc5IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
