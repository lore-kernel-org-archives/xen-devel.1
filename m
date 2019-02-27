From: Norbert Manthey <nmanthey@amazon.de>
Subject: L1TF Patch Series v8
Date: Wed, 27 Feb 2019 17:13:33 +0100
Message-ID: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=70d2=RC=amazon.de=prvs=954cd6bf9=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gz1qO-0005dn-UJ
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 16:14:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBzZXJpZXMgYXR0ZW1wdHMgdG8gbWl0aWdhdGUgdGhlIGlzc3VlIHRoYXQgaGF2
ZSBiZWVuIHJhaXNlZCBpbiB0aGUKWFNBLTI4OSAoaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcveHNh
L2Fkdmlzb3J5LTI4OS5odG1sKS4gVG8gYmxvY2sgc3BlY3VsYXRpdmUKZXhlY3V0aW9uIG9uIElu
dGVsIGhhcmR3YXJlLCBhbiBsZmVuY2UgaW5zdHJ1Y3Rpb24gaXMgcmVxdWlyZWQgdG8gbWFrZSBz
dXJlCnRoYXQgc2VsZWN0ZWQgY2hlY2tzIGFyZSBub3QgYnlwYXNzZWQuIFNwZWN1bGF0aXZlIG91
dC1vZi1ib3VuZCBhY2Nlc3NlcyBjYW4KYmUgcHJldmVudGVkIGJ5IHVzaW5nIHRoZSBhcnJheV9p
bmRleF9ub3NwZWMgbWFjcm8uCgpUaGUgbWFqb3IgY2hhbmdlIGNvbXBhcmVkIHRvIHZlcnNpb24g
OCBpcyBpbiBncmFudF90YWJsZSBoYW5kbGluZywgcHJvdGVjdGluZwphIGZldyBtb3JlIHZlcnNp
b24gY29tcGFyaXNvbnMuCgpCZXN0LApOb3JiZXJ0CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50
ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVl
aHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAy
MzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkx
NzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
