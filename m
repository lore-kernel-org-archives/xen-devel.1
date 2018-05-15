From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.11 v4 1/1] Add new add_maintainers.pl
 script to optimise the workflow when using git format-patch with
 get_maintainer.pl
Date: Tue, 15 May 2018 16:35:16 +0100
Message-ID: <23290.65076.759978.448604@mariner.uk.xensource.com>
References: <cover.1526056304.git.lars.kurth@citrix.com>
 <f4fb11576b144aa6bdf243d678162a171b7a5ba9.1526056304.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ihpv=ic=citrix.com=prvs=6668be420=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fIbz7-0002uG-It
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 15:35:29 +0000
In-Reply-To: <f4fb11576b144aa6bdf243d678162a171b7a5ba9.1526056304.git.lars.kurth@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

TGFycyBLdXJ0aCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTEgdjQgMS8xXSBBZGQgbmV3IGFkZF9t
YWludGFpbmVycy5wbCBzY3JpcHQgdG8gb3B0aW1pc2UgdGhlIHdvcmtmbG93IHdoZW4gdXNpbmcg
Z2l0IGZvcm1hdC1wYXRjaCB3aXRoIGdldF9tYWludGFpbmVyLnBsIik6Cj4gVGhlIHRvb2wgY292
ZXJzIHN0ZXAgMiBvZiB0aGUgZm9sbG93aW5nIHdvcmtmbG93CgpUaGFua3MuICBTb3JyeSB0byBz
cG90IHRoaXMgb25seSBub3csIGJ1dAoKPiArc3ViIHdyaXRlZmlsZSAoJCQpIHsKPiArICAgIG15
ICgkY29udGVudCwgJGZpbGUpID0gQF87Cj4gKyAgICBteSAkZmg7Cj4gKyAgICBvcGVuKCRmaCwg
Ij4iLCAkZmlsZSkKPiArICAgICAgICAgb3IgZGllICJDb3VsZCBub3Qgb3BlbiBmaWxlICckZmls
ZScgJCEiOwo+ICsgICAgcHJpbnQgJGZoICRjb250ZW50IG9yIGRpZSAkITsKPiArICAgIGNsb3Nl
ICRmaCBvciBkaWUgJCE7Cj4gK30KCnRoaXMgd2lsbCBsb3NlIGRhdGEgaWYgeW91ciBkaXNrIGlz
IGZ1bGwuCgpZb3Ugd2FudDoKCiAgc3ViIHdyaXRlZmlsZSAoJCQpIHsKICAgICAgbXkgKCRjb250
ZW50LCAkZmlsZSkgPSBAXzsKICAgICAgbXkgJGZoOwogICAgICBvcGVuKCRmaCwgIj4iLCAiJGZp
bGUudG1wIikKICAgICAgICAgICBvciBkaWUgIkNvdWxkIG5vdCBvcGVuIGZpbGUgJyRmaWxlLnRt
cCcgJCEiOwogICAgICBwcmludCAkZmggJGNvbnRlbnQgb3IgZGllICQhOwogICAgICBjbG9zZSAk
Zmggb3IgZGllICQhOwogICAgICByYW5lbSAiJGZpbGUudG1wIiwgJGZpbGUgb3IgZGllICJDb3Vs
ZCBub3QgcmVuYW1lICckZmlsZScgaW50byBwbGFjZSAkISI7CiAgfQoKKE5COiB1bnRlc3RlZC4p
CgpBc2lkZSBmcm9tIHRoYXQsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgpEbyB5b3Ugd2FudCBtZSB0byBwaWNrIHVwIG15IHN1Z2dlc3RlZCBjaGFu
Z2UgYW5kIHRlc3QgaXQgPwoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
