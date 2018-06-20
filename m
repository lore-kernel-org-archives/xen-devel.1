From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/suspend: Fix restoration of
 guest state across S3/S4
Date: Wed, 20 Jun 2018 13:22:17 +0200
Message-ID: <d1297be8-40fe-6c17-d4ea-4fcb3c0e7d26@suse.com>
References: <1529489545-14489-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1529489545-14489-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDYvMTggMTI6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIGNhbGwgdG8gZnJl
ZXplX2RvbWFpbnMoKSBpbiBlbnRlcl9zdGF0ZSgpIGd1YXJlbnRlZXMgdGhhdCB3ZSBhcmUKPiBy
dW5uaW5nIGluIGlkbGUgY29udGV4dCBmb3IgdGhlIGR1cmF0aW9uIG9mIFMzL1M0Lgo+IAo+IElu
IHJlc3RvcmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUoKSwgdGhlIHN0dHMoKSBpcyBwcm9ibGVtYXRp
YyBhcyBpdAo+IHVuaWxhdGVyYWxseSBzZXRzICVjcjAudHMgZXZlbiBpbiBmdWxseV9lYWdlciBG
UFUgY29udGV4dC4gIEl0IGFsc28gZmFpbHMgdG8KPiBhY2NvdW50IGZvciB0aGUgbm9uLWxhenkg
eHNhdmUgc3RhdGUuICBMdWNraWx5LCB0aGVzZSBhcmUgYm90aCBsYXRlbnQgYnVncywgYXMKPiB0
aGUgRlBVIHN0YXRlIGlzIGNvcnJlY3RlZCBieSB0aGUgc3Vic2VxdWVudCBjb250ZXh0IHN3aXRj
aCBhd2F5IGZyb20gdGhlIGlkbGUKPiB2Y3B1Lgo+IAo+IEFub3RoZXIgYXNwZWN0IGlzIHRoYXQg
dGhlICFpc19pZGxlX3ZjcHUoY3VycikgcGF0aHMgaW4KPiByZXN0b3JlX3Jlc3RfcHJvY2Vzc29y
X3N0YXRlKCkgYXJlIGFjdHVhbGx5IGRlYWQgY29kZSwgYW5kIHJlbW92aW5nCj4gdGhlc2UgaGln
aGxpZ2h0cyB0aGF0IHRoZSBzZWdtZW50IHNhdmluZyBsb2dpYyBpcyBhbHNvIHVudXNlZC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
