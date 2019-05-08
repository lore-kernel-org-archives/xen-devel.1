From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 10/12] x86/IRQ: reduce unused space in struct
 arch_irq_desc
Date: Wed, 08 May 2019 07:13:11 -0600
Message-ID: <5CD2D5E7020000780022CD82@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMNo-0007mM-6W
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:13:16 +0000
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvaXJxLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9pcnEuaApAQCAtNDEs
OCArNDEsOCBAQCBzdHJ1Y3QgYXJjaF9pcnFfZGVzYyB7CiAgICAgICAgIGNwdW1hc2tfdmFyX3Qg
Y3B1X21hc2s7CiAgICAgICAgIGNwdW1hc2tfdmFyX3Qgb2xkX2NwdV9tYXNrOwogICAgICAgICBj
cHVtYXNrX3Zhcl90IHBlbmRpbmdfbWFzazsKLSAgICAgICAgdW5zaWduZWQgbW92ZV9jbGVhbnVw
X2NvdW50OwogICAgICAgICB2bWFza190ICp1c2VkX3ZlY3RvcnM7CisgICAgICAgIHVuc2lnbmVk
IG1vdmVfY2xlYW51cF9jb3VudDsKICAgICAgICAgdTggbW92ZV9pbl9wcm9ncmVzcyA6IDE7CiAg
ICAgICAgIHM4IHVzZWQ7CiB9OwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
