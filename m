From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 5/6] x86: avoid explicit TLB flush when
 saving exec state
Date: Fri, 19 Jan 2018 17:59:13 +0000
Message-ID: <CAFLBxZbrFz7cYWn51b+cebzPepVL32ahs8oZEnS_M1gJ9MXr6g@mail.gmail.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6225A202000078001A07D5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xl7c=eo=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ecaxg-0000pj-DZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 18:00:20 +0000
Received: by mail-qt0-f174.google.com with SMTP id d54so5839799qtd.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2018 10:00:14 -0800 (PST)
In-Reply-To: <5A6225A202000078001A07D5@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgNDowNiBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiBOb3cgdGhhdCBpdCdzIG9idmlvdXMgdGhhdCBvbmx5IGEgc2luZ2xl
IGRpcnR5IENQVSBjYW4gZXhpc3QgZm9yIGEgdkNQVSwKPiBpdCBiZWNvbWVzIGNsZWFyIHRoYXQg
Zmx1c2hfbWFzaygpIGRvZXNuJ3QgbmVlZCB0byBiZSBpbnZva2VkIHdoZW4KPiBzeW5jX2xvY2Fs
X2V4ZWNzdGF0ZSgpIHdhcyBhbHJlYWR5IHJ1bi4gIEFuZCB3aXRoIHRoZSBJUEkgaGFuZGxlcgo+
IGNsZWFyaW5nIEZMVVNIX1RMQiBmcm9tIHRoZSBwYXNzZWQgZmxhZ3MgYW55d2F5IGlmCj4gX19z
eW5jX2xvY2FsX2V4ZWNzdGF0ZSgpIHJldHVybnMgdHJ1ZSwgaXQgYWxzbyBiZWNvbWVzIGNsZWFy
IHRoYXQKPiBGTFVTSF9UTEIgZG9lc24ndCBuZWVkIHRvIGJlIHBhc3NlZCBoZXJlIGluIHRoZSBm
aXJzdCBwbGFjZS4KCkkgdGhpbmsgdGhlIG5hbWluZyBoZXJlIGlzIGEgYml0IGNvbmZ1c2luZy4g
IEluIHRoZW9yeSwgdGhlIGZhY3QgdGhhdApfX3N5bmNfbG9jYWxfZXhlY3N0YXRlKCkgdXNlcyBf
X2NvbnRleHRfc3dpdGNoKCkgdG8gc3luYyB0aGUgcmVnaXN0ZXJzCihhbmQgdGh1cyBhbHNvIGZs
dXNoZXMgdGhlIFRMQikgaXMgYW4gaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsLgpCdXQg
d2hlbiB2aWV3ZWQgZnVydGhlciBiYWNrLCBpdCdzIGNsZWFyIHRoYXQgMSkgc3luY2luZyB0aGUg
c3RhdGUKYWx3YXlzIGhhcHBlbnMgYmVjYXVzZSB5b3UgZGlkbid0IGNhbGwgX19jb250ZXh0X3N3
aXRjaCgpIGJlZm9yZSwgYW5kCjIpIHRoZSBtb3N0IHJvYnVzdCB3YXkgdG8gbWFrZSBzdXJlIHRo
YXQgdGhlICdzeW5jJyB3b3JrcyBjb3JyZWN0bHkgaXMKZm9yIGl0IHRvIHVzZSB0aGUgc2FtZSBw
YXRoIGFzIHRoZSBhY3R1YWwgY29udGV4dCBzd2l0Y2guCgpJIHdhcyBvcmlnaW5hbGx5IGdvaW5n
IHRvIG9iamVjdCB0byByZW1vdmluZyB0aGUgZmxhZyBvbiB0aGUgZ3JvdW5kcwp0aGF0IHRoZSBp
bXBsZW1lbnRhdGlvbiBvZiBfX3N5bmNfbG9jYWxfZXhlY3N0YXRlKCkgY291bGQgaW4gdGhlb3J5
CmNoYW5nZSAoc3VjaCB0aGF0IG5vIFRMQiB3YXMgZmx1c2hlZCk7IGJ1dCBJIG5vdyB0aGluayB0
aGF0J3MgcHJldHR5CnVubGlrZWx5LgoKQnV0IEkgZG8gdGhpbmsgdGhhdCB0aGUgbmFtaW5nIHRo
ZSB3YXkgaXQgaXMgbWF5IGxlYWQgcGVvcGxlIHRvCmJlbGlldmUgdGhhdCBGTFVTSF9TVEFURSB3
aWxsICpub3QqIHJlc3VsdCBpbiBhIGZsdXNoZWQgVExCLgoKQXQgdmVyeSBsZWFzdCBhIGNvbW1l
bnQgbmVhciBGTFVTSF9TVEFURSdzIGRlZmluaXRpb24gc2hvdWxkIG1lbnRpb24gdGhpcyBmYWN0
LgoKT3RoZXIgdGhhbiB0aGF0LCBMR1RNLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
