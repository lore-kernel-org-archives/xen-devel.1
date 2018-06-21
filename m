From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/EFI: Fix FPU state handling
 around runtime calls
Date: Thu, 21 Jun 2018 07:06:04 +0200
Message-ID: <c8e015ba-4e20-d864-5ef0-ac8f12e6db92@suse.com>
References: <1529547257-17221-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1529547257-17221-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDYvMTggMDQ6MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRoZXJlIGFyZSB0d28gaXNzdWVzLiAgRmlyc3Qs
IHRoZSBub25sYXp5IHhzdGF0ZXMgd2VyZSBuZXZlciByZXN0b3JlZAo+IGFmdGVyIHJldHVybmlu
ZyBmcm9tIHRoZSBydW50aW1lIGNhbGwuCj4gCj4gU2Vjb25kbHksIHdpdGggdGhlIGZ1bGx5X2Vh
Z2VyX2ZwdSBtaXRpZ2F0aW9uIGZvciBYU0EtMjY3IC8gTGF6eUZQVSwgdGhlCj4gdW5pbGF0ZXJh
bCBzdHRzKCkgaXMgbm8gbG9uZ2VyIGNvcnJlY3QsIGFuZCBoaXRzIGFuIGFzc2VydGlvbiBsYXRl
ciB3aGVuCj4gYSBsYXp5IHN0YXRlIHJlc3RvcmUgdHJpZXMgdG8gb2NjdXIgZm9yIGEgZnVsbHkg
ZWFnZXIgdmNwdS4KPiAKPiBGaXggYm90aCBvZiB0aGVzZSBpc3N1ZXMgYnkgY2FsbGluZyB2Y3B1
X3Jlc3RvcmVfZnB1X2VhZ2VyKCkuICBBcyBFRkkKPiBydW50aW1lIHNlcnZpY2VzIGNhbiBiZSB1
c2VkIGluIHRoZSBpZGxlIGNvbnRleHQsIHRoZSBpZGxlIGFzc2VydGlvbgo+IG5lZWRzIHRvIG1v
dmUgdW50aWwgYWZ0ZXIgdGhlIGZ1bGx5X2VhZ2VyX2ZwdSBjaGVjay4KPiAKPiBJbnRyb2R1Y2Ug
YSAiY3VyciIgbG9jYWwgdmFyaWFibGUgYW5kIHJlcGxhY2Ugb3RoZXIgdXNlcyBvZiAiY3VycmVu
dCIKPiBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
