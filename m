From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/7] assorted (mostly) atomics changes
Date: Mon, 11 Mar 2019 10:44:16 -0600
Message-ID: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3O2H-0000vG-SS
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:44:21 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

MTogZXZlbnRzOiBkcm9wIGFyY2hfZXZ0Y2huX2luamVjdCgpCjI6IGNvbW1vbjogYXZvaWQgYXRv
bWljIHJlYWQtbW9kaWZ5LXdyaXRlIGFjY2Vzc2VzIGluIG1hcF92Y3B1X2luZm8oKQozOiBBcm0v
YXRvbWljOiBjb3JyZWN0IGFzbSgpIGNvbnN0cmFpbnRzIGluIGJ1aWxkX2FkZF9zaXplZCgpCjQ6
IEFybS9hdG9taWM6IGRyb3AgdW5pZm9ybWx5IHVzZWQgcmVnIG1hY3JvIHBhcmFtZXRlcnMKNTog
QXJtL2F0b21pYzogcGFyYW1ldGVyaXplIHJlZ2lzdGVyIG1vZGlmaWVyIG1hY3JvIGFyZ3VtZW50
cwo2OiBBcm0vYXRvbWljOiB1bmlmeSBnZW5lcmF0aW9uIG9mIHU2NCByZWFkL3dyaXRlIGZ1bmN0
aW9ucwo3OiBBcm0vYXRvbWljOiBjb3NtZXRpY3MKCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
