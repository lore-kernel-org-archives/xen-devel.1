From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
Date: Wed, 2 May 2018 10:56:05 +0300
Message-ID: <8ed56ab2-7f34-9d50-7ed3-5dd1c0b17424@gmail.com>
References: <20180430215436.21062-1-marmarek@invisiblethingslab.com>
 <a8517064-40fb-d873-2879-bb4047e1ebc4@gmail.com>
 <5AE9667E02000078001BFF04@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AE9667E02000078001BFF04@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOCAxMDoxOSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDUu
MTggYXQgMDc6MjksIDxhbmRyMjAwMEBnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiAwNS8wMS8yMDE4
IDEyOjU0IEFNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4+PiBVc2luZyBS
SU5HX0dFVF9SRVNQT05TRSgpIG9uIGEgc2hhcmVkIHJpbmcgaXMgZWFzeSB0byB1c2UgaW5jb3Jy
ZWN0bHkKPj4+IChpLmUuLCBieSBub3QgY29uc2lkZXJpbmcgdGhhdCB0aGUgb3RoZXIgZW5kIG1h
eSBhbHRlciB0aGUgZGF0YSBpbiB0aGUKPj4+IHNoYXJlZCByaW5nIHdoaWxlIGl0IGlzIGJlaW5n
IGluc3BlY3RlZCkuICBTYWZlIHVzYWdlIG9mIGEgcmVzcG9uc2UKPj4+IGdlbmVyYWxseSByZXF1
aXJlcyB0YWtpbmcgYSBsb2NhbCBjb3B5Lgo+PiBJIGRvIG5vdCBhZ3JlZSB3aXRoIHRoYXQuIENv
cHlpbmcgc3RpbGwgZG9lc24ndCBtYWtlIGFsbCB0aGUgYWJvdmUgc2FmZQo+PiBhcyBub3RoaW5n
IHByZXZlbnRzIHRoZSBiYWNrZW5kIGZyb20gb3ZlcndyaXRpbmcgdGhlIHJlc3BvbnNlIHdoaWxl
Cj4+IGZyb250ZW5kIG1ha2VzIGl0cyBsb2NhbCBjb3B5Lgo+IEJ1dCB0aGF0J3Mgbm90IHRoZSBw
b2ludCBoZXJlOiBXaGF0IHRoZSBmcm9udGVuZCB3YW50cyBpcyBhIHNpbmdsZSwgY29uc2lzdGVu
dAo+IChpLmUuIG5vdCBmdXJ0aGVyIGNoYW5naW5nKSB2aWV3IG9mIHRoZSByZXNwb25zZSwgaS5l
LiBhdm9pZCB0aGUgbXVsdGlwbGUgcmVhZHMKPiBpc3N1ZSBhZGRyZXNzZWQgaW4gWFNBLTE1NSBm
b3IgYmFja2VuZHMuIE9uY2UgaXQgaGFzIHRoYXQsIGl0IGNvdWxkIHN0aWxsIGFwcGx5Cj4gKHNh
bml0eSkgY2hlY2tzIHRvIHRoYXQgbG9jYWwgY29weSAoanVzdCBsaWtlIGJhY2tlbmRzIHRvIGZv
ciByZXF1ZXN0cykuCk9rLCBidXQgdGhlIHdheSBpdCBpcyBzdGF0ZWQgaXQgY291bGQgbWFrZSBv
bmUgdGhpbmsgd2UgYXJlIG9uIHRoZSBzYWZlIApzaWRlIGFmdGVyIHRoYXQKY29weWluZy4gSSB3
b3VsZCBsb3ZlIHRvIHNlZSBzb21lIHNvcnQgb2YgdGhlIGV4cGxhbmF0aW9uIGxpa2UgeW91IGdh
dmUgCmluIHRoZQpjb21taXQgbWVzc2FnZSB0aGVuLgo+IEphbgo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
