From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Mon, 06 May 2019 02:27:48 -0600
Message-ID: <5CCFF004020000780022C0D4@prv1-mh.provo.novell.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNYyg-0008C3-3H
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:28:02 +0000
In-Reply-To: <20190506065644.7415-2-jgross@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA1LjE5IGF0IDA4OjU2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MjA3LDYgKzI1MCwxNDEgQEAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2ZyZWVfZG9tZGF0YShj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+ICAgICAgICAgIEFTU0VSVCghZGF0YSk7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc2NoZWRfYWxsb2NfcGRhdGEoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqcywgaW50IGNwdSkKPiArewo+ICsgICAgaWYgKCBzLT5hbGxvY19wZGF0YSAp
Cj4gKyAgICAgICAgcmV0dXJuIHMtPmFsbG9jX3BkYXRhKHMsIGNwdSk7Cj4gKyAgICBlbHNlCj4g
KyAgICAgICAgcmV0dXJuIE5VTEw7Cj4gK30KCkluIGNhc2VzIGxpa2UgdGhpcyBvbmUgSSdkIGxp
a2UgdG8gYXNrIHRoYXQgZWl0aGVyID86IGJlIHVzZWQsIG9yIHRoZSBwb2ludGxlc3MKImVsc2Ui
IGJlIGRyb3BwZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
