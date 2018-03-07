From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH LINUX] Fixes to xen-blkfront.
Date: Wed,  7 Mar 2018 15:55:08 -0500
Message-ID: <20180307205509.25524-1-konrad.wilk@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0eh6=f5=char.us.oracle.com=konrad@srs-us1.protection.inumbo.net>)
 id 1etgAv-0000cn-BU
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 21:00:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGkhCgpXZSBmb3VuZCB0aGlzIHRpbnkgYnVnIHdoZW4gd2Ugd2VyZSB1bnBsdWdnaW5nIGFuZCBy
ZS1wbHVnZ2luZwpkaWZmZXJlbnQgYmxvY2stZGV2aWNlcyB0byBhIGd1ZXN0IGFuZCBmb3VuZCBh
IGJ1ZyBpbiB0aGVyZQpyZXN1bHRpbmcgaW4gdGhlIG11bHRpLXF1ZXVlIHBhcmFtZXRlciBiZWlu
ZyBsb3N0LgoKVGhpcyBwYXRjaCBmaXhlcyBpdC4gSSBtZWFudCB0byBwb3N0IHRoaXMgaW4gRGVj
ZW1iZXIgYnV0CmdvdCBzaWRlLXRyYWNrZWQgd2l0aCBTcGVjdHJlX3YyIHdvcmsuCgoKIGRyaXZl
cnMvYmxvY2sveGVuLWJsa2Zyb250LmMgfCAxNyArKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCgpCaGF2ZXNoIERhdmRhICgx
KToKICAgICAgeGVuLWJsa2Zyb250OiBtb3ZlIG5lZ290aWF0ZV9tcSB0byBjb3ZlciBhbGwgY2Fz
ZXMgb2YgbmV3IFZCRHMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
