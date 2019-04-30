From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: vcpu_block() and do_poll() question
Date: Tue, 30 Apr 2019 05:48:30 -0600
Message-ID: <5CC8360E020000780022A70A@prv1-mh.provo.novell.com>
References: <3ce4998b*a8a8*37bd*bb26*9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1*mh.provo.novell.com>
 <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
 <5CC82593020000780022A50D@suse.com>
 <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLRFT-0001hO-L4
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:48:35 +0000
In-Reply-To: <dd2eb4c4-4144-17ae-f7a6-a4287aeac461@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE5IGF0IDEyOjQ0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBbiBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSBtZW1vcnkgYmFycmllcnMgYmV0d2VlbiB0aGUgd3JpdGVzIG9u
IEFSTSwKPiByaWdodD8gT3IgYSBzdHJvbmcgb3JkZXJlZCBzZXRfYml0KCkgdmFyaWFudCAod2Ug
aGFkIHRoYXQgZGlzY3Vzc2lvbgo+IHJlY2VudGx5IHJlbGF0ZWQgdG8gYSBiYXJyaWVyIGluIEFS
TS1zcGVjaWZpYyBfX2NwdV9kaXNhYmxlKCkpLgoKWWVzLgoKPiBUaGVuIHdlIGNvdWxkIGRyb3Ag
dGhpcyAjaWZuZGVmIHNlY3Rpb24uCgpOb3Qgc3VyZSBhYm91dCB0aGlzIC0gSSdtIGFjdHVhbGx5
IHVuY29udmluY2VkIHRoZSBsYXR0ZXIgcGFydCBvZgp3aGF0J3MgaW5zaWRlIHRoZSAjaWZkZWYg
aXNuJ3QgYWN0dWFsbHkgbmVlZGVkIG9uIHg4NiBhcyB3ZWxsLiBKdXN0CmNvbnNpZGVyIHRoZSBj
YXNlIG9mIHZjcHVfdW5ibG9jaygpIG1ha2luZyBpdCB0byB0aGUgdmNwdV93YWtlKCkKaW52b2Nh
dGlvbiBvbiBhbm90aGVyIENQVSB3aGlsZSB3ZSdyZSBiZXR3ZWVuIGFueSB0d28gb2YgdGhlCnRo
cmVlIHdyaXRlcyBoZXJlLiAoSSBrbm93IEkndmUgYmVlbiBmZWVsaW5nIHVuZWFzeSBhYm91dCB0
aGlzCmJlZm9yZSwgYnV0IEkgZ3Vlc3MgSSBtdXN0IGhhdmUgY29tZSB0byB0aGUgY29uY2x1c2lv
biB0aGF0IGl0J3MKX3Byb2JhYmx5XyBva2F5LikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
