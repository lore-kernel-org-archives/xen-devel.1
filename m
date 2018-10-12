From: Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH v1 3/8] xen: sched: Credit2: show runqueue
 id during runqueue dump
Date: Fri, 12 Oct 2018 19:44:08 +0200
Message-ID: <153936624851.22652.10984530319522981716.stgit@wayrath>
References: <153936590062.22652.12114301510794181099.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d/jz=my=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1gB1Tw-0002Iu-Jl
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 17:44:12 +0000
Received: by mail-wr1-f65.google.com with SMTP id d2-v6so14323745wro.7
 for <xen-devel@lists.xenproject.org>; Fri, 12 Oct 2018 10:44:12 -0700 (PDT)
In-Reply-To: <153936590062.22652.12114301510794181099.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5zdGVhZCB0aGFuIGp1c3QgYSBzZXF1ZW5jZSBudW1iZXIsIGFuZCBjb25zaXN0ZW50bHkKd2l0
aCB3aGF0J3Mgc2hvd24gd2hlbiB0aGUgcnVucXVldWVzIGFyZSBjcmVhdGVkLgoKQWxzbyBhZGQg
c29tZSBtb3JlIHByZXR0eSBwcmludGluZyBoZXJlIGFuZCB0aGVyZS4KCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9s
aUBzdXNlLmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgfCAgICA1ICsrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKaW5k
ZXggMDZiNDU3MjVmYS4uNjE3YTdlY2U2ZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9j
cmVkaXQyLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKQEAgLTM2NTgsNyArMzY1
OCw3IEBAIGR1bXBfcGNwdShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGludCBjcHUpCiAj
ZGVmaW5lIGNwdXN0ciBrZXloYW5kbGVyX3NjcmF0Y2gKIAogICAgIGNwdW1hc2tfc2NucHJpbnRm
KGNwdXN0ciwgc2l6ZW9mKGNwdXN0ciksIHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSk7
Ci0gICAgcHJpbnRrKCJDUFVbJTAyZF0gcnVucT0lZCwgc2libGluZz0lcywgIiwgY3B1LCBjMnIo
Y3B1KSwgY3B1c3RyKTsKKyAgICBwcmludGsoIiBDUFVbJTAyZF0gcnVucT0lZCwgc2libGluZz0l
cywgIiwgY3B1LCBjMnIoY3B1KSwgY3B1c3RyKTsKICAgICBjcHVtYXNrX3NjbnByaW50ZihjcHVz
dHIsIHNpemVvZihjcHVzdHIpLCBwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpOwogICAgIHBy
aW50aygiY29yZT0lc1xuIiwgY3B1c3RyKTsKIApAQCAtMzc2MCw3ICszNzYwLDggQEAgY3NjaGVk
Ml9kdW1wKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcykKICAgICAgICAgLyogV2UgbmVlZCB0
aGUgbG9jayB0byBzY2FuIHRoZSBydW5xdWV1ZS4gKi8KICAgICAgICAgc3Bpbl9sb2NrKCZycWQt
PmxvY2spOwogCi0gICAgICAgIHByaW50aygiUnVucXVldWUgJWQ6XG4iLCBpKTsKKyAgICAgICAg
cHJpbnRrKCJSdW5xdWV1ZSAlZDpcbiIsIHJxZC0+aWQpOworICAgICAgICBwcmludGsoIkNQVXM6
XG4iKTsKIAogICAgICAgICBmb3JfZWFjaF9jcHUoaiwgJnJxZC0+YWN0aXZlKQogICAgICAgICAg
ICAgZHVtcF9wY3B1KG9wcywgaik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
