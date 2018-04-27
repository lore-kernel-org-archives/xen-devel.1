From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: VMOVNTDQA should raise #GP(0) on
 mis-alignment
Date: Fri, 27 Apr 2018 06:10:22 -0600
Message-ID: <5AE3132E02000078001BF183@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kfj1=hq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fC2Cp-0000dy-32
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 12:10:27 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDUwYjczMTE4ZDUgaW50cm9kdWNlZCBlbXVsYXRpb24gb2YgdGhlIGluc24gd2l0aG91
dCBleHRlbmRpbmcgdGhlCnNldCBvZiBvcGNvZGVzIHJlcXVpcmluZyBzcGVjaWFsIGFsaWdubWVu
dCByZWxhdGVkICNHUCBiZWhhdmlvci4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC04NTE5
LDExICs4NTE5LDEyIEBAIHg4Nl9lbXVsYXRlKAogCiAgICAgICAgICAgICBpZiAoIG9wX2J5dGVz
IDwgMTYgfHwKICAgICAgICAgICAgICAgICAgKHZleC5vcGN4Ci0gICAgICAgICAgICAgICAgICA/
IC8qIHZtb3Z7e2EsbnR9cHtzLGR9LGRxYSxudGRxfSBhcmUgZXhjZXB0aW9ucy4gKi8KLSAgICAg
ICAgICAgICAgICAgICAgZXh0ICE9IGV4dF8wZiB8fAotICAgICAgICAgICAgICAgICAgICAoKGIg
fCAxKSAhPSAweDI5ICYmIGIgIT0gMHgyYiAmJgotICAgICAgICAgICAgICAgICAgICAgKChiIHwg
MHgxMCkgIT0gMHg3ZiB8fCB2ZXgucGZ4ICE9IHZleF82NikgJiYKLSAgICAgICAgICAgICAgICAg
ICAgIGIgIT0gMHhlNykKKyAgICAgICAgICAgICAgICAgID8gLyogdm1vdnt7YSxudH1we3MsZH0s
eyxudH1kcWEsbnRkcX0gYXJlIGV4Y2VwdGlvbnMuICovCisgICAgICAgICAgICAgICAgICAgIGV4
dCA9PSBleHRfMGYKKyAgICAgICAgICAgICAgICAgICAgPyAoKGIgfCAxKSAhPSAweDI5ICYmIGIg
IT0gMHgyYiAmJgorICAgICAgICAgICAgICAgICAgICAgICAoKGIgfCAweDEwKSAhPSAweDdmIHx8
IHZleC5wZnggIT0gdmV4XzY2KSAmJgorICAgICAgICAgICAgICAgICAgICAgICBiICE9IDB4ZTcp
CisgICAgICAgICAgICAgICAgICAgIDogKGV4dCAhPSBleHRfMGYzOCB8fCBiICE9IDB4MmEpCiAg
ICAgICAgICAgICAgICAgICA6IC8qIG1vdnVwe3MsZH0sIHssbWFza31tb3ZkcXUsIGFuZCBsZGRx
dSBhcmUgZXhjZXB0aW9ucy4gKi8KICAgICAgICAgICAgICAgICAgICAgZXh0ID09IGV4dF8wZiAm
JgogICAgICAgICAgICAgICAgICAgICAoKGIgfCAxKSA9PSAweDExIHx8CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
