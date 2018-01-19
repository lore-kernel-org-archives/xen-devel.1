From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 3/6] add check to cpumask_of()
Date: Fri, 19 Jan 2018 09:04:33 -0700
Message-ID: <5A62252102000078001A078E@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mpbx=eo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ecZ9i-000611-HG
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 16:04:38 +0000
In-Reply-To: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SnVzdCBsaWtlIGFueSBvdGhlciBmdW5jdGlvbidzIENQVSBpbnB1dHMsIHRoZSBvbmUgaGVyZSBz
aG91bGRuJ3QgZ28KdW5jaGVja2VkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUveGVuL2NwdW1hc2suaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vY3B1bWFzay5oCkBAIC0zMDQsNyArMzA0LDkgQEAgZXh0ZXJuIGNvbnN0IHVu
c2lnbmVkIGxvbmcKIAogc3RhdGljIGlubGluZSBjb25zdCBjcHVtYXNrX3QgKmNwdW1hc2tfb2Yo
dW5zaWduZWQgaW50IGNwdSkKIHsKLQljb25zdCB1bnNpZ25lZCBsb25nICpwID0gY3B1X2JpdF9i
aXRtYXBbMSArIGNwdSAlIEJJVFNfUEVSX0xPTkddOworCWNvbnN0IHVuc2lnbmVkIGxvbmcgKnAg
PSBjcHVfYml0X2JpdG1hcFsxICsgY3B1bWFza19jaGVjayhjcHUpICUKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVRTX1BFUl9MT05HXTsKKwog
CXJldHVybiAoY29uc3QgY3B1bWFza190ICopKHAgLSBjcHUgLyBCSVRTX1BFUl9MT05HKTsKIH0K
IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
