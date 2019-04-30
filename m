From: Juergen Gross <jgross@suse.com>
Subject: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 11:13:28 +0200
Message-ID: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9h7v=TA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hLOpR-0003tO-CH
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 09:13:33 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SW4geGVuL2NvbW1vbi9zY2hlZHVsZS5jIHRoZXJlIGlzIGEgd2VpcmQgIiNpZm5kZWYgQ09ORklH
X1g4NiIgaW4KZG9fcG9sbCgpLgoKSXQgd2FzIGludHJvZHVjZWQgd2F5IGJlZm9yZSBhbnlvbmUg
d291bGQgdGhpbmsgYWJvdXQgQVJNIGJ5IGNvbW1pdAplZjRjNmIwNzljYzU1ZSAoSSBjb3VsZG4n
dCBmaW5kIGFueSB4ZW4tZGV2ZWwgbWFpbCByZWxhdGVkIHRvIHRoYXQKY29tbWl0KSwgc28gSSBn
dWVzcyBpdCBpcyByZWxhdGVkIHRvIElBNjQ/CgpRdWVzdGlvbiBpczogY2FuIHdlIGp1c3QgZHJv
cCBpdCwgb3IgZG9lcyBBUk0gZGVwZW5kIG9uIGl0PyBBbmQgaWYgQVJNCnJlYWxseSBuZWVkcyBp
dCwgaXMgaXQgdGhlIG1lbW9yeSBiYXJyaWVyIG9ubHk/IEFuZCB3aHkgd291bGRuJ3QgYQpzaW1p
bGFyIGJhcnJpZXIgYmUgbmVlZGVkIGluIHZjcHVfYmxvY2soKSB0aGVuPwoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
