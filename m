From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 2/8] xen/arm: p2m: Provide an
 helper to generate the VTTBR
Date: Thu, 24 Jan 2019 11:06:12 +0000
Message-ID: <5f781024-904e-b332-2777-39888fa80c3e@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1901231527030.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3Qo=QA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmcps-0002zc-4I
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 11:06:16 +0000
In-Reply-To: <alpine.DEB.2.10.1901231527030.17936@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIzLzAxLzIwMTkgMjM6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDI4IE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEEgZm9sbG93
LXVwIHBhdGNoIHdpbGwgbmVlZCB0byBnZW5lcmF0ZSB0aGUgVlRUQlIgaW4gYSBmZXcgcGxhY2Vz
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
Pgo+PiAtLS0KPj4gICB4ZW4vYXJjaC9hcm0vcDJtLmMgfCA3ICsrKysrKy0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4gaW5kZXggNmM3NjI5
OGViYy4uOGViZjFlOGRiYSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+PiBAQCAtNDcsNiArNDcsMTEgQEAgc3RhdGljIGNvbnN0
IHBhZGRyX3QgbGV2ZWxfbWFza3NbXSA9Cj4+ICAgc3RhdGljIGNvbnN0IHVpbnQ4X3QgbGV2ZWxf
b3JkZXJzW10gPQo+PiAgICAgICB7IFpFUk9FVEhfT1JERVIsIEZJUlNUX09SREVSLCBTRUNPTkRf
T1JERVIsIFRISVJEX09SREVSIH07Cj4+ICAgCj4+ICtzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVf
dnR0YnIodWludDE2X3Qgdm1pZCwgbWZuX3Qgcm9vdF9tZm4pCj4+ICt7Cj4+ICsgICAgcmV0dXJu
IChtZm5fdG9fbWFkZHIocm9vdF9tZm4pIHwgKCh1aW50NjRfdCl2bWlkIDw8IDQ4KSk7Cj4gCj4g
T3V0ZXIgYnJhY2tldHMgYXJlIG5vdCBuZWNlc3NhcnkuIFJlZ2FyZGxlc3M6CgpJIHdvdWxkIHBy
ZWZlciB0byBrZWVwIHRoZW0gaGVyZS4KCj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
