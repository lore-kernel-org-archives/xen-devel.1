From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/EFI: Fix FPU state handling
 around runtime calls
Date: Thu, 21 Jun 2018 10:52:45 +0200
Message-ID: <d5a1d639-0242-fcad-ff7b-45bca18e0be0@suse.com>
References: <1529547257-17221-1-git-send-email-andrew.cooper3@citrix.com>
 <c8e015ba-4e20-d864-5ef0-ac8f12e6db92@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c8e015ba-4e20-d864-5ef0-ac8f12e6db92@suse.com>
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

T24gMjEvMDYvMTggMDc6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMjEvMDYvMTggMDQ6
MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4KPj4gVGhlcmUgYXJlIHR3byBpc3N1ZXMuICBGaXJzdCwgdGhlIG5vbmxhenkg
eHN0YXRlcyB3ZXJlIG5ldmVyIHJlc3RvcmVkCj4+IGFmdGVyIHJldHVybmluZyBmcm9tIHRoZSBy
dW50aW1lIGNhbGwuCj4+Cj4+IFNlY29uZGx5LCB3aXRoIHRoZSBmdWxseV9lYWdlcl9mcHUgbWl0
aWdhdGlvbiBmb3IgWFNBLTI2NyAvIExhenlGUFUsIHRoZQo+PiB1bmlsYXRlcmFsIHN0dHMoKSBp
cyBubyBsb25nZXIgY29ycmVjdCwgYW5kIGhpdHMgYW4gYXNzZXJ0aW9uIGxhdGVyIHdoZW4KPj4g
YSBsYXp5IHN0YXRlIHJlc3RvcmUgdHJpZXMgdG8gb2NjdXIgZm9yIGEgZnVsbHkgZWFnZXIgdmNw
dS4KPj4KPj4gRml4IGJvdGggb2YgdGhlc2UgaXNzdWVzIGJ5IGNhbGxpbmcgdmNwdV9yZXN0b3Jl
X2ZwdV9lYWdlcigpLiAgQXMgRUZJCj4+IHJ1bnRpbWUgc2VydmljZXMgY2FuIGJlIHVzZWQgaW4g
dGhlIGlkbGUgY29udGV4dCwgdGhlIGlkbGUgYXNzZXJ0aW9uCj4+IG5lZWRzIHRvIG1vdmUgdW50
aWwgYWZ0ZXIgdGhlIGZ1bGx5X2VhZ2VyX2ZwdSBjaGVjay4KPj4KPj4gSW50cm9kdWNlIGEgImN1
cnIiIGxvY2FsIHZhcmlhYmxlIGFuZCByZXBsYWNlIG90aGVyIHVzZXMgb2YgImN1cnJlbnQiCj4+
IGF0IHRoZSBzYW1lIHRpbWUuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBvbiBhbiBFRkkgbWFjaGlu
ZTogd2l0aG91dCB0aGUgcGF0Y2ggWGVuIGNyYXNoZWQKd2hpbGUgYm9vdGluZyBEb20wLCB3aXRo
IHRoZSBwYXRjaCB0aGUgc3lzdGVtIGNhbWUgdXAuIFNvIHlvdSBjYW4gYWRkOgoKVGVzdGVkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
