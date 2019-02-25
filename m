From: Norbert Manthey <nmanthey@amazon.de>
Subject: [PATCH L1TF v8 5/9] is_control_domain: block speculation
Date: Mon, 25 Feb 2019 14:34:39 +0100
Message-ID: <1551101683-996-6-git-send-email-nmanthey@amazon.de>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cCv=RA=amazon.de=prvs=952b5b9ed=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gyGQw-0006vg-0n
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 13:36:38 +0000
In-Reply-To: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
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

Q2hlY2tzIG9mIGRvbWFpbiBwcm9wZXJ0aWVzLCBzdWNoIGFzIGlzX2hhcmR3YXJlX2RvbWFpbiBv
ciBpc19odm1fZG9tYWluLAptaWdodCBiZSBieXBhc3NlZCBieSBzcGVjdWxhdGl2ZWx5IGV4ZWN1
dGluZyB0aGVzZSBpbnN0cnVjdGlvbnMuIEEgcmVhc29uCmZvciBieXBhc3NpbmcgdGhlc2UgY2hl
Y2tzIGlzIHRoYXQgdGhlc2UgbWFjcm9zIGFjY2VzcyB0aGUgZG9tYWluCnN0cnVjdHVyZSB2aWEg
YSBwb2ludGVyLCBhbmQgY2hlY2sgYSBjZXJ0YWluIGZpZWxkLiBTaW5jZSB0aGlzIG1lbW9yeQph
Y2Nlc3MgaXMgc2xvdywgdGhlIENQVSBhc3N1bWVzIGEgcmV0dXJuZWQgdmFsdWUgYW5kIGNvbnRp
bnVlcyB0aGUKZXhlY3V0aW9uLgoKSW4gY2FzZSBhbiBpc19jb250cm9sX2RvbWFpbiBjaGVjayBp
cyBieXBhc3NlZCwgZm9yIGV4YW1wbGUgZHVyaW5nIGEKaHlwZXJjYWxsLCBkYXRhIHRoYXQgc2hv
dWxkIG9ubHkgYmUgYWNjZXNzaWJsZSBieSB0aGUgY29udHJvbCBkb21haW4gY291bGQKYmUgbG9h
ZGVkIGludG8gdGhlIGNhY2hlLgoKVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJk
ZW5pbmcgZWZmb3J0LgoKU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBh
bWF6b24uZGU+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0K
Ck5vdGVzOgogIHY4OiBhZGRlZCBhY2tlZC1ieQoKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmgKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgKQEAgLTkxMywxMCArOTEzLDEwIEBAIHZvaWQgd2F0Y2hkb2dfZG9tYWluX2Rlc3Ry
b3koc3RydWN0IGRvbWFpbiAqZCk7CiAgKiAgICAodGhhdCBpcywgdGhpcyB3b3VsZCBub3QgYmUg
c3VpdGFibGUgZm9yIGEgZHJpdmVyIGRvbWFpbikKICAqICAtIFRoZXJlIGlzIG5ldmVyIGEgcmVh
c29uIHRvIGRlbnkgdGhlIGhhcmR3YXJlIGRvbWFpbiBhY2Nlc3MgdG8gdGhpcwogICovCi0jZGVm
aW5lIGlzX2hhcmR3YXJlX2RvbWFpbihfZCkgKChfZCkgPT0gaGFyZHdhcmVfZG9tYWluKQorI2Rl
ZmluZSBpc19oYXJkd2FyZV9kb21haW4oX2QpIGV2YWx1YXRlX25vc3BlYygoX2QpID09IGhhcmR3
YXJlX2RvbWFpbikKIAogLyogVGhpcyBjaGVjayBpcyBmb3IgZnVuY3Rpb25hbGl0eSBzcGVjaWZp
YyB0byBhIGNvbnRyb2wgZG9tYWluICovCi0jZGVmaW5lIGlzX2NvbnRyb2xfZG9tYWluKF9kKSAo
KF9kKS0+aXNfcHJpdmlsZWdlZCkKKyNkZWZpbmUgaXNfY29udHJvbF9kb21haW4oX2QpIGV2YWx1
YXRlX25vc3BlYygoX2QpLT5pc19wcml2aWxlZ2VkKQogCiAjZGVmaW5lIFZNX0FTU0lTVChkLCB0
KSAodGVzdF9iaXQoVk1BU1NUX1RZUEVfICMjIHQsICYoZCktPnZtX2Fzc2lzdCkpCiAKLS0gCjIu
Ny40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3Ry
LiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIs
IFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
