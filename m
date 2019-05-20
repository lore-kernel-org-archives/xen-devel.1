From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
Date: Mon, 20 May 2019 10:19:26 +0100
Message-ID: <236744ae-6faa-d543-3450-2da58019e117@citrix.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
 <20190520091435.k4txcb4m3lx7n4py@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSeSY-000206-CO
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:19:54 +0000
In-Reply-To: <20190520091435.k4txcb4m3lx7n4py@Air-de-Roger>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDUvMjAxOSAxMDoxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPgo+PiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgYi90b29scy9saWJ4bC9saWJ4bF9tZW0uYwo+
PiBpbmRleCA0NDhhMmFmOGZkLi5mZTFmOWMyZmY4IDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4
bC9saWJ4bF9tZW0uYwo+PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9tZW0uYwo+PiBAQCAtNDU3
LDYgKzQ1NywyNCBAQCBpbnQgbGlieGxfZG9tYWluX25lZWRfbWVtb3J5KGxpYnhsX2N0eCAqY3R4
LAo+PiAgICAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2luaXQoYl9pbmZvKTsKPj4gICAgICBs
aWJ4bF9kb21haW5fYnVpbGRfaW5mb19jb3B5KGN0eCwgYl9pbmZvLCBiX2luZm9faW4pOwo+PiAg
Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBJdCBoYXMgYmVjb21lIGEgcmVxdWlyZW1lbnQgdGhhdCB0
byBmaWd1cmUgb3V0IHdoaWNoIFFFTVUgdG8KPj4gKyAgICAgKiB1c2UsIGxpYnhsIHdpbGwgbmVl
ZCB0byBwZWVrIGRfY29uZmlnJ3MgY29udGVudC4gVGhlIGNvZGUgaGFzCj4+ICsgICAgICogYmVl
biBjaGFuZ2VkIHN1Y2ggdGhhdCBvbmUgd2lsbCBuZWVkIHRvIGNhbGwKPj4gKyAgICAgKiBsaWJ4
bF9fZG9tYWluX3NldF9kZXZpY2VfbW9kZWwgYmVmb3JlIGNhbGxpbmcKPj4gKyAgICAgKiBsaWJ4
bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCBpbnNpZGUgbGlieGwuCj4+ICsgICAgICoK
Pj4gKyAgICAgKiBUaGlzIChwcm9ibGVtYXRpYykgcHVibGljIEFQSSBpcyB0aGUgb25seSBvbmUg
d2hpY2ggdGFrZXMgYQo+PiArICAgICAqIGJfaW5mbywgaW1wb3NpbmcgdGhlIHNhbWUgcmVxdWly
ZW1lbnQgb24gdGhlIHVzZXJzIG9mIHRoaXMKPj4gKyAgICAgKiBwdWJsaWMgQVBJIHdpbGwgYnJl
YWsgdGhlbS4KClRoaXMgc2VudGVuY2UgZG9lc24ndCBxdWl0ZSBwYXJzZS7CoCBZb3UgZWl0aGVy
IHdhbnQgImJfaW5mby7CoCBJbXBvc2luZyIsCm9yIHNvbWV0aGluZyBsaWtlICJiX2luZm8sIGFu
ZCBpbXBvc2luZyIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
