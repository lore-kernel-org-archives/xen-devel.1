From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/3] xen: Introduce shared buffer helpers
 for page directory...
Date: Tue, 4 Dec 2018 19:28:05 -0500
Message-ID: <ab1b0d28-f3a1-41ec-82df-2474553dbefe__1508.09835545278$1543969637$gmane$org@oracle.com>
References: <20181130074205.20496-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dae=OO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gUL3E-00049B-KC
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 00:28:28 +0000
In-Reply-To: <20181130074205.20496-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org, jgross@suse.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMzAvMTggMjo0MiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+Cj4gYmFzZWQgZnJvbnRlbmRzLiBDdXJyZW50bHkgdGhlIGZyb250ZW5kcyB3aGljaCBp
bXBsZW1lbnQKPiBzaW1pbGFyIGNvZGUgZm9yIHNoYXJpbmcgYmlnIGJ1ZmZlcnMgYmV0d2VlbiBm
cm9udGVuZCBhbmQKPiBiYWNrZW5kIGFyZSBwYXJhLXZpcnR1YWxpemVkIERSTSBhbmQgc291bmQg
ZHJpdmVycy4KPiBCb3RoIGRlZmluZSB0aGUgc2FtZSB3YXkgdG8gc2hhcmUgZ3JhbnQgcmVmZXJl
bmNlcyBvZiBhCj4gZGF0YSBidWZmZXIgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBiYWNrZW5kIHdp
dGggbGl0dGxlCj4gZGlmZmVyZW5jZXMuCj4KPiBNb3ZlIHNoYXJlZCBjb2RlIGludG8gYSBoZWxw
ZXIgbW9kdWxlLCBzbyB0aGVyZSBpcyBhIHNpbmdsZQo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSBz
YW1lIGZ1bmN0aW9uYWxpdHkgZm9yIGFsbC4KPgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBjb2Rl
IHdoaWNoIGlzIHVzZWQgYnkgc291bmQgYW5kIGRpc3BsYXkKPiBmcm9udGVuZCBkcml2ZXJzIHdp
dGhvdXQgZnVuY3Rpb25hbCBjaGFuZ2VzIHdpdGggdGhlIGludGVudGlvbgo+IHRvIHJlbW92ZSBz
aGFyZWQgY29kZSBmcm9tIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlcnMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+CgpBY2tlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
