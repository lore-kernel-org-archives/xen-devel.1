From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] xen: fix two issues in Xen pv qspinlock
 handling
Date: Mon, 1 Oct 2018 09:37:01 +0200
Message-ID: <9840f232-acc4-310d-d87d-8fbf329a9664__16310.3649313145$1538379363$gmane$org@suse.com>
References: <20181001071641.19282-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yvko=mn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g6slM-00065P-Dq
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 07:37:04 +0000
In-Reply-To: <20181001071641.19282-1-jgross@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, hpa@zytor.com, Waiman Long <longman@redhat.com>, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

Q29ycmVjdGluZyBXYWltYW4ncyBtYWlsIGFkZHJlc3MKCk9uIDAxLzEwLzIwMTggMDk6MTYsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gVGhlIFhlbiBzcGVjaWZpYyBxdWV1ZSBzcGlubG9jayB3YWl0
IGZ1bmN0aW9uIGhhcyB0d28gaXNzdWVzIHdoaWNoCj4gY291bGQgcmVzdWx0IGluIGEgaGFuZ2lu
ZyBzeXN0ZW0uCj4gCj4gVGhleSBoYXZlIGEgc2ltaWxhciByb290IGNhdXNlIG9mIGNsZWFyaW5n
IGEgcGVuZGluZyB3YWtldXAgb2YgYQo+IHdhaXRpbmcgdmNwdSBhbmQgbGF0ZXIgZ29pbmcgdG8g
c2xlZXAgd2FpdGluZyBmb3IgdGhlIGp1c3QgY2xlYXJlZAo+IHdha2V1cCBldmVudCwgd2hpY2gg
b2YgY291cnNlIHdvbid0IGV2ZXIgaGFwcGVuLgo+IAo+IEp1ZXJnZW4gR3Jvc3MgKDIpOgo+ICAg
eGVuOiBmaXggcmFjZSBpbiB4ZW5fcWxvY2tfd2FpdCgpCj4gICB4ZW46IG1ha2UgeGVuX3Fsb2Nr
X3dhaXQoKSBuZXN0YWJsZQo+IAo+ICBhcmNoL3g4Ni94ZW4vc3BpbmxvY2suYyB8IDMzICsrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4gCj4gQ2M6IGxvbmdtYW5AcmVkaGF0LmNvbQo+IENj
OiBwZXRlcnpAaW5mcmFkZWFkLm9yZwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
