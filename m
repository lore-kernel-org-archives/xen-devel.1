From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Fri, 6 Apr 2018 13:38:00 +0200
Message-ID: <93857f65-c2aa-16da-f192-ac885d855fd1@suse.com>
References: <20180406075256.8427-1-jgross@suse.com>
 <20180406075256.8427-3-jgross@suse.com>
 <5b3c515d-ff2e-4159-8760-2ea5c87aa5aa@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ofhv=g3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f4Pgy-0005If-D3
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 11:38:04 +0000
In-Reply-To: <5b3c515d-ff2e-4159-8760-2ea5c87aa5aa@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMTggMTM6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDYvMDQvMTggMDg6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4gc3dpdGNoaW5nIHRvIGEgNjQtYml0IHB2
IGNvbnRleHQgdGhlIFRMQiBpcyBmbHVzaGVkIHR3aWNlIHRvZGF5Ogo+PiB0aGUgZmlyc3QgdGlt
ZSB3aGVuIHN3aXRjaGluZyB0byB0aGUgbmV3IGFkZHJlc3Mgc3BhY2UgaW4KPj4gd3JpdGVfcHRi
YXNlKCksIHRoZSBzZWNvbmQgdGltZSB3aGVuIHN3aXRjaGluZyB0byBndWVzdCBtb2RlIGluCj4+
IHJlc3RvcmVfdG9fZ3Vlc3QuCj4+Cj4+IExpbWl0IHRoZSBmaXJzdCBmbHVzaCB0byBub24tZ2xv
YmFsIGVudHJpZXMgaW4gdGhhdCBjYXNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gVGhpcyBpc24ndCBzYWZlLsKgIElmIGFueSBzcGVjdWxhdGlvbi9w
cmVmZXRjaGluZyBoYXBwZW5zIGludG8gdGhlIG5ldwo+IGd1ZXN0IG1hcHBpbmdzLCB3ZSB3aWxs
IGdldCBtYWNoaW5lIGNoZWNrIGV4Y2VwdGlvbnMuCgpPa2F5LCBJJ2xsIGRyb3AgdGhhdCBwYXRj
aCAoaXQgaXMgbW9yZSBvciBsZXNzIHVuZG9uZSBieSBwYXRjaCA0CmFueXdheSkuCgoKSnVlcmdl
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
