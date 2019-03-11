From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 08:11:08 -0600
Message-ID: <5C866C7C020000780021D3D9@prv1-mh.provo.novell.com>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
 <20190311114947.1d47e04e.olaf@aepfle.de>
 <5C864446020000780021D29A@prv1-mh.provo.novell.com>
 <20190311130931.737ee8c6.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3LeB-0003rI-6Q
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 14:11:19 +0000
In-Reply-To: <20190311130931.737ee8c6.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDEzOjA5LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEFtIE1v
biwgMTEgTWFyIDIwMTkgMDU6MTk6MzQgLTA2MDAKPiBzY2hyaWViICJKYW4gQmV1bGljaCIgPEpC
ZXVsaWNoQHN1c2UuY29tPjoKPiAKPj4gQnV0IG9mIGNvdXJzZSB0aGUgc2VlbWluZ2x5Cj4+IHJh
bmRvbSAyMDAgd2lsbCBpdHNlbGYgbmVlZCBhIG11Y2ggYmV0dGVyIHJlYXNvbmluZywgb3IgYXQg
bGVhc3QgYQo+PiBjbGVhciBpbmRpY2F0aW9uIG9mIHRoZSBkYXRhIGJhc2UgKG51bWJlciBvZiBk
aWZmZXJlbnQgc3lzdGVtcykgdGhhdAo+PiBpdCB3YXMgZGVyaXZlZCBmcm9tLiAiTGFyZ2UgbnVt
YmVyIG9mIGhvc3RzIiwgYWZ0ZXIgYWxsLCBtYXkgbWVhbiAxMgo+PiB0byB5b3UgYW5kIHRlbnMg
b2YgdGhvdXNhbmRzIHRvIG1lLgo+IAo+IEhvdyBtYW55IGhvc3RzIHdvdWxkIGJlIHJlbGV2YW50
PwoKSSBkb24ndCBrbm93LiBNb3JlIHRoYW4gZG96ZW5zIGJ1dCBsZXNzIHRoYW4gdGVucyBvZiB0
aG91c2FuZHMsCkknZCBzYXkuCgo+IE15IG93biB0ZXN0IGhvc3RzIGNhbGlicmF0ZSBpdHNlbGYg
aW4gYSByYW5nZSBvZiBtYXliZSAzMCBraHouCj4gSSBnYXZlIHVwIHRvIHRyYWNrIHRoZSBleGFj
dCBudW1iZXJzIGFmdGVyIGV2ZXJ5IHJlYm9vdC4KClRoZSB2YXJpYW5jZSBvZiB0aGUgY2FsaWJy
YXRpb24gcmVzdWx0IHNheXMgbm90aGluZyBhYm91dCB0aGUKYWJzb2x1dGUgZXJyb3IsIG5vciBh
Ym91dCBhbnkgcG9zc2libGUgZHJpZnQuIEl0J3Mgb25seSBhbiBpbmRpY2F0aW9uCm9mIHRoZSBx
dWFsaXR5IG9mIHRoZSBjYWxpYnJhdGlvbiBsb2dpYyBfcGx1c18gdGhlIHN0YWJpbGl0eSBvZiB0
aGUKYmFzZSBmcmVxdWVuY3kuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
