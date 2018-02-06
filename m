From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] Choose retpoline only when it is safe to use
Date: Tue, 6 Feb 2018 09:20:35 +0000
Message-ID: <8d9a8a62-9a39-d09d-d5aa-bef8f207a5a4@citrix.com>
References: <d4c3bc09-c284-4372-acb4-27f0d913afe2@default>
 <00176009-d6ae-faa9-439c-0520c3c4788f@citrix.com>
 <4f00a69a-4032-048d-3ffd-b7b6756ed596@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4f00a69a-4032-048d-3ffd-b7b6756ed596@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhenzhong.duan@oracle.com, JBeulich@suse.com
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDIvMjAxOCAwOToxMywgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4g5ZyoIDIwMTgvMi82
IDE2OjU5LCBBbmRyZXcgQ29vcGVyIOWGmemBkzoKPj4gT24gMDYvMDIvMjAxOCAwODo0MywgWmhl
bnpob25nIER1YW4gd3JvdGU6Cj4+PiBXaGVuICggaWJycyAmJiB0aHVuayA9PSBUSFVOS19ERUZB
VUxUICYmICFyZXRwb2xpbmVfc2FmZSgpICkgaXMgdHJ1ZSwKPj4+IHRodW5rIGlzIHNldCB0byBU
SFVOS19KTVAgcmF0aGVyIHRoYW4gVEhVTktfUkVUUE9MSU5FLgo+Pj4KPj4+IFdoZW4gKCFpYnJz
ICYmIHRodW5rID09IFRIVU5LX0RFRkFVTFQgJiYgIXJldHBvbGluZV9zYWZlKCkgKSBpcyB0cnVl
LAo+Pj4gd2Ugc2hvdWxkIGRvIHRoZSBzYW1lLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFpoZW56
aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+PiBXaHk/wqAgV2hhdCBpbXBy
b3ZlbWVudCBpcyB0aGlzIGludGVuZGVkIHRvIGdpdmU/Cj4gTm8gaW1wcm92ZW1lbnQsIEkganVz
dCBmZWVsIGlmIHJldHBvbGluZSBpc24ndCBzYWZlLCBUSFVOS19KTVAgaXMKPiBiZXR0ZXIgYW5k
IHNhZmVyLgo+IEFib3ZlIGZpcnN0IGNoZWNrIGlzIHdvcmtpbmcgdGhhdCB3YXkuCgpJZiB5b3Vy
IG9ubHkgdHdvIGNob2ljZXMgYXJlIHVuc2FmZSByZXBvbGluZSBvciBwbGFpbiBqdW1wcywgdGhl
biB1bnNhZmUKcmVwb2xpbmUgaXMgZmFyIGZhciBmYXIgc2FmZXIuCgpJdHMgdW5zYWZlIHByb3Bl
cnRpZXMgb25seSBraWNrIGluIG9uIGFuIFJTQiB1bmRlcmZsb3csIGFuZCBhbiBhdHRhY2tlcgp3
b3VsZCBoYXZlIHRvIGRvIGNhbGwtZGVwdGhzIGFuYWx5c2lzIG9mIHRoZSBydW5uaW5nIGJpbmFy
eSB0byBpZGVudGlmeQp3aGljaCByZXRzIHRvIGF0dGVtcHQgdG8gcG9pc29uLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
