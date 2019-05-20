From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/svm: Drop support for AMD's Lightweight
 Profiling
Date: Mon, 20 May 2019 05:40:39 -0600
Message-ID: <5CE292370200007800230938@prv1-mh.provo.novell.com>
References: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hSgeq-0008Pv-Ff
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:40:44 +0000
In-Reply-To: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA1LjE5IGF0IDEyOjEzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTGlnaHR3ZWlnaHQgUHJvZmlsaW5nIHdhcyBpbnRyb2R1Y2VkIGluIEJ1bGxkb3plciAo
RmFtMTVoKSwgYnV0IHdhcyBkcm9wcGVkCj4gZnJvbSBaZW4gKEZhbTE3aCkgcHJvY2Vzc29ycy4g
IEZ1cnRoZXJtb3JlLCBMV1Agd2FzIGRyb3BwZWQgZnJvbSBGYW0xNS8xNiBDUFVzCj4gd2hlbiBJ
QlBCIGZvciBTcGVjdHJlIHYyIHdhcyBpbnRyb2R1Y2VkIGluIG1pY3JvY29kZSwgb3dpbmcgdG8g
TFdQIG5vdCBiZWluZwo+IHVzZWQgaW4gcHJhY3RpY2UuCj4gCj4gQXMgYSByZXN1bHQsIENQVXMg
d2hpY2ggYXJlIG9wZXJhdGluZyB3aXRoaW4gc3BlY2lmaWNhdGlvbiAoaS5lLiB3aXRoIHVwIHRv
Cj4gZGF0ZSBtaWNyb2NvZGUpIG5vIGxvbmdlciBoYXZlIHRoaXMgZmVhdHVyZSwgYW5kIHRoZXJl
Zm9yZSBhcmUgbm90IHVzaW5nIGl0Lgo+IAo+IERyb3Agc3VwcG9ydCBmcm9tIFhlbi4gIFRoZSBt
YWluIG1vdGl2YXRpb24gaGVyZSBpcyB0byByZW1vdmUgdW5uZWNlc3NhcnkKPiBjb21wbGV4aXR5
IGZyb20gQ1BVSUQgaGFuZGxpbmcsIGJ1dCBpdCBhbHNvIHRpZGllcyB1cCB0aGUgU1ZNIGNvZGUg
bmljZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oCj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaAo+IEBAIC0x
NzYsNyArMTc2LDcgQEAgWEVOX0NQVUZFQVRVUkUoSUJTLCAgICAgICAgICAgMyozMisxMCkgLyog
ICBJbnN0cnVjdGlvbiBCYXNlZCBTYW1wbGluZyAqLwo+ICBYRU5fQ1BVRkVBVFVSRShYT1AsICAg
ICAgICAgICAzKjMyKzExKSAvKkEgIGV4dGVuZGVkIEFWWCBpbnN0cnVjdGlvbnMgKi8KPiAgWEVO
X0NQVUZFQVRVUkUoU0tJTklULCAgICAgICAgMyozMisxMikgLyogICBTS0lOSVQvU1RHSSBpbnN0
cnVjdGlvbnMgKi8KPiAgWEVOX0NQVUZFQVRVUkUoV0RULCAgICAgICAgICAgMyozMisxMykgLyog
ICBXYXRjaGRvZyB0aW1lciAqLwo+IC1YRU5fQ1BVRkVBVFVSRShMV1AsICAgICAgICAgICAzKjMy
KzE1KSAvKlMgIExpZ2h0IFdlaWdodCBQcm9maWxpbmcgKi8KPiArWEVOX0NQVUZFQVRVUkUoTFdQ
LCAgICAgICAgICAgMyozMisxNSkgLyogICBMaWdodCBXZWlnaHQgUHJvZmlsaW5nICovCgpTdHJp
Y3RseSBzcGVha2luZyB0aGlzIGlzIG5vdCBwZXJtaXR0ZWQgKHNlZSB0aGUgb3RoZXIgdGhyZWFk
IG9uCnRoaXMgYmVpbmcgcGFydCBvZiB0aGUgcHVibGljIGludGVyZmFjZSkuIEJ1dCBvZiBjb3Vy
c2Ugc3RyaWN0bHkKc3BlYWtpbmcgaXQgd2FzIGFsc28gbm90IHBlcm1pdHRlZCBmb3IgQU1EIHRv
IHJlbW92ZSB0aGUKZmVhdHVyZSBpbiBhIHVjb2RlIHVwZGF0ZSAoSSB3b25kZXIgYnR3IHdoZXRo
ZXIgdGhlIGluc25zCmluZGVlZCAjVUQgbm93IG9uIEZhbTE1LzE2KS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
