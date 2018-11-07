From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/xen: fix pv boot
Date: Wed, 7 Nov 2018 17:36:10 +0000
Message-ID: <d8a07a83-2595-f22e-ca9c-313f74bb11ba__19098.9678063945$1541612102$gmane$org@citrix.com>
References: <20181107170100.9435-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vh0l=ns=citrix.com=prvs=84296f867=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gKRkW-0008GP-JF
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 17:36:16 +0000
In-Reply-To: <20181107170100.9435-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTEvMTggMTc6MDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gQ29tbWl0IDlkYTNmMmI3
NDA1NDQwICgieDg2L2ZhdWx0OiBCVUcoKSB3aGVuIHVhY2Nlc3MgaGVscGVycyBmYXVsdCBvbgo+
IGtlcm5lbCBhZGRyZXNzZXMiKSBpbnRyb2R1Y2VkIGEgcmVncmVzc2lvbiBmb3IgYm9vdGluZyBY
ZW4gUFYgZ3Vlc3RzLgo+Cj4gWGVuIFBWIGd1ZXN0cyBhcmUgdXNpbmcgX19wdXRfdXNlcigpIGFu
ZCBfX2dldF91c2VyKCkgZm9yIGFjY2Vzc2luZyB0aGUKPiBwMm0gbWFwIChwaHlzaWNhbCB0byBt
YWNoaW5lIGZyYW1lIG51bWJlciBtYXApIGFzIGFjY2Vzc2VzIG1pZ2h0IGZhaWwKPiBpbiBjYXNl
IG9mIG5vdCBwb3B1bGF0ZWQgYXJlYXMgb2YgdGhlIG1hcC4KPgo+IFdpdGggYWJvdmUgY29tbWl0
IHVzaW5nIF9fcHV0X3VzZXIoKSBhbmQgX19nZXRfdXNlcigpIGZvciBhY2Nlc3NpbmcKPiBrZXJu
ZWwgcGFnZXMgaXMgbm8gbG9uZ2VyIHZhbGlkLiBTbyByZXBsYWNlIHRoZSBYZW4gaGFjayBieSBh
ZGRpbmcKPiBhcHByb3ByaWF0ZSBwMm0gYWNjZXNzIGZ1bmN0aW9ucyB1c2luZyB0aGUgZGVmYXVs
dCBmaXh1cCBoYW5kbGVyLgo+Cj4gRml4ZXM6IDlkYTNmMmI3NDA1NDQwICgieDg2L2ZhdWx0OiBC
VUcoKSB3aGVuIHVhY2Nlc3MgaGVscGVycyBmYXVsdCBvbiBrZXJuZWwgYWRkcmVzc2VzIikKPiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
