From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 05/14] x86/p2m: Don't overwrite
 p2m_altp2m_lazy_copy()'s callers p2m pointer
Date: Wed, 21 Nov 2018 16:07:02 +0200
Message-ID: <db36cf73-e621-31e6-34dd-042d2d26bb28@bitdefender.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-6-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMzoyMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZmluYWwgcGFy
YW1ldGVyIHRvIHAybV9hbHRwMm1fbGF6eV9jb3B5KCkgYXBwZWFycyB0byBiZSB1bm5lY2Vzc2Fy
eSwgYW5kCj4gcmVzdWx0cyBpbiB2ZXJ5IGhhcmQtdG8tZm9sbG93IGNvZGUuICBIYXZlIHRoZSBz
b2xlIGNhbGxlciBzZXQgaXRzIGxvY2FsIHAybQo+IHBvaW50ZXIgYXBwcm9wcmlhdGVseSwgYW5k
IGRyb3AgdGhlIHBhcmFtZXRlci4KPiAKPiBXaXRoIHRoYXQgZG9uZSwgYSBsZXZlbCBvZiBpbmRp
cmVjdGlvbiBvZiBhcDJtIGNhbiBiZSBkcm9wcGVkIGluc2lkZQo+IHAybV9hbHRwMm1fbGF6eV9j
b3B5KCkuICBXaGlsZSBjaGFuZ2luZyB0aGUgQVBJLCBzd2l0Y2ggaXQgZnJvbSBib29sX3QgdG8K
PiBib29sLCBhbmQgZHJvcCBwcmludGluZyBvZiB0aGUgYWx0cDJtJ3MgdmlydHVhbCBhZGRyZXNz
LCBiZWNhdXNlIGl0IGlzIG9mIG5vCj4gdXNlIGV2ZW4gd2hlbiBkZWJ1Z2dpbmcuCj4gCj4gTm8g
KGludGVuZGVkKSBvdmVyYWxsIGNoYW5nZSBpbiBiZWhhdmlvdXIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJpZ2h0LCBJIHNl
ZSB5b3UndmUgY2hhbmdlZCB0aGUgcmV0dXJuIHR5cGUgb2YgcDJtX2FsdHAybV9sYXp5X2NvcHko
KQpmcm9tIGJvb2xfdCB0byBib29sIGhlcmUsIHNvIHBsZWFzZSBkaXNyZWdhcmQgbXkgcHJldmlv
dXMgY29tbWVudC4KClJldmlld2VkLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRk
ZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
