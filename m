From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 4.19-rc2
Date: Fri, 31 Aug 2018 16:17:17 +0200
Message-ID: <20180831141717.17603-1-jgross__18320.1243206442$1535724972$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/b/z=lo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvkEk-0004Xw-Fo
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 14:17:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjE5Yi1yYzItdGFnCgp4ZW46IGZpeGVzIGZvciA0LjE5LXJjMgoKSXQgY29udGFpbnM6Ci0gbWlu
b3IgY2xlYW51cCBhdm9pZGluZyBhIHdhcm5pbmcgd2hlbiBidWlsZGluZyB3aXRoIG5ldyBnY2MK
LSBhIHBhdGNoIHRvIGFkZCBhIG5ldyBzeXNmcyBub2RlIGZvciBYZW4gZnJvbnRlbmQvYmFja2Vu
ZCBkcml2ZXJzCiAgdG8gbWFrZSBpdCBlYXNpZXIgdG8gb2J0YWluIHRoZSBzdGF0ZSBvZiBhIHB2
IGRldmljZQotIHR3byBmaXhlcyBmb3IgMzItYml0IHB2LWd1ZXN0cyB0byBhdm9pZCBpbnRlcm1l
ZGlhdGUgTDFURiB2dWxuZXJhYmxlCiAgUFRFcwoKVGhhbmtzLgoKSnVlcmdlbgoKIERvY3VtZW50
YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1idXMteGVuLWJhY2tlbmQgfCA5ICsrKysrKysrKwogYXJj
aC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaCAgICAgICAgICB8IDcgKysrLS0tLQog
YXJjaC94ODYveGVuL21tdV9wdi5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDkgKysrLS0t
LS0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICAgICAgIHwgOSAr
KysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgpDb2xpbiBJYW4gS2luZyAoMSk6CiAgICAgIHg4Ni94ZW46IHJlbW92ZSByZWR1bmRhbnQg
dmFyaWFibGUgc2F2ZV9wdWQKCkpvZSBKaW4gKDEpOgogICAgICB4ZW46IGV4cG9ydCBkZXZpY2Ug
c3RhdGUgdG8gc3lzZnMKCkp1ZXJnZW4gR3Jvc3MgKDIpOgogICAgICB4ODYveGVuOiBkb24ndCB3
cml0ZSBwdGVzIGRpcmVjdGx5IGluIDMyLWJpdCBQViBndWVzdHMKICAgICAgeDg2L3BhZTogdXNl
IDY0IGJpdCBhdG9taWMgeGNoZyBmdW5jdGlvbiBpbiBuYXRpdmVfcHRlcF9nZXRfYW5kX2NsZWFy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
