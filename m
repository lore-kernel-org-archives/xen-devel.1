From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] xen: fix two issues in Xen pv qspinlock
 handling
Date: Mon,  1 Oct 2018 09:16:39 +0200
Message-ID: <20181001071641.19282-1-jgross__23403.480431489$1538378149$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yvko=mn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g6sRt-0004RZ-3w
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 07:16:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, Waiman.Long@hp.com, peterz@infradead.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

VGhlIFhlbiBzcGVjaWZpYyBxdWV1ZSBzcGlubG9jayB3YWl0IGZ1bmN0aW9uIGhhcyB0d28gaXNz
dWVzIHdoaWNoCmNvdWxkIHJlc3VsdCBpbiBhIGhhbmdpbmcgc3lzdGVtLgoKVGhleSBoYXZlIGEg
c2ltaWxhciByb290IGNhdXNlIG9mIGNsZWFyaW5nIGEgcGVuZGluZyB3YWtldXAgb2YgYQp3YWl0
aW5nIHZjcHUgYW5kIGxhdGVyIGdvaW5nIHRvIHNsZWVwIHdhaXRpbmcgZm9yIHRoZSBqdXN0IGNs
ZWFyZWQKd2FrZXVwIGV2ZW50LCB3aGljaCBvZiBjb3Vyc2Ugd29uJ3QgZXZlciBoYXBwZW4uCgpK
dWVyZ2VuIEdyb3NzICgyKToKICB4ZW46IGZpeCByYWNlIGluIHhlbl9xbG9ja193YWl0KCkKICB4
ZW46IG1ha2UgeGVuX3Fsb2NrX3dhaXQoKSBuZXN0YWJsZQoKIGFyY2gveDg2L3hlbi9zcGlubG9j
ay5jIHwgMzMgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpDYzogV2FpbWFuLkxvbmdAaHAu
Y29tCkNjOiBwZXRlcnpAaW5mcmFkZWFkLm9yZwoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
