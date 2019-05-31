From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/4] x86: further speed-up to hweight{32,64}()
Date: Fri, 31 May 2019 03:52:55 -0600
Message-ID: <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeDa-0005ZD-Qv
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:52:58 +0000
In-Reply-To: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWNjb3JkaW5nIHRvIExpbnV4IGNvbW1pdCAwMTM2NjExYzYyICgib3B0aW1pemUgaHdlaWdodDY0
IGZvciB4ODZfNjQiKQp0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVyIHRoZSB2YXJp
YW50IHVzaW5nIG9ubHkgYml0d2lzZQpvcGVyYXRpb25zLiBJdCdzIGFsc28gYSBzbGlnaHQgZnVy
dGhlciBjb2RlIHNpemUgcmVkdWN0aW9uLgoKU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysgYi94ZW4vYXJj
aC94ODYvS2NvbmZpZwpAQCAtMTIsNiArMTIsNyBAQCBjb25maWcgWDg2CiAJc2VsZWN0IEhBU19D
UFVGUkVRCiAJc2VsZWN0IEhBU19FSENJCiAJc2VsZWN0IEhBU19FWF9UQUJMRQorCXNlbGVjdCBI
QVNfRkFTVF9NVUxUSVBMWQogCXNlbGVjdCBIQVNfR0RCU1gKIAlzZWxlY3QgSEFTX0lPUE9SVFMK
IAlzZWxlY3QgSEFTX0tFWEVDCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
