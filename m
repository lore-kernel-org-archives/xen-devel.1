From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] libxl: fix build (missing
 CLONE_NEWIPC) on astonishingly old systems
Date: Mon, 14 Jan 2019 02:47:58 -0700
Message-ID: <5C3C5ACE020000780020D1C3@prv1-mh.provo.novell.com>
References: <20190111182706.GA2199@perard.uk.xensource.com>
 <20190111192328.25242-1-ian.jackson@eu.citrix.com>
 <4C7EABEB02000006B8D7C7D4@prv1-mh.provo.novell.com>
 <9E406FBD020000569DFFD529@prv1-mh.provo.novell.com>
 <9E4077BD020000969DFFD529@prv1-mh.provo.novell.com>
 <81E41643020000ABCFD95477@prv1-mh.provo.novell.com>
 <CE47AFED020000429DFFD529@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1giysd-0004Jq-PU
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 09:50:03 +0000
In-Reply-To: <CE47AFED020000429DFFD529@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@eu.citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAxLjE5IGF0IDIwOjIzLCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ0xPTkVfTkVXSVBDIHdhcyBpbnRyb2R1Y2VkIGluIExpbnV4IDIuNi4xOSwgb24gdGhl
IDI5dGggb2YgTm92ZW1iZXIKPiAyMDA2LCB3aGljaCB3YXMgMTIgeWVhcnMsIDEgbW9udGgsIGFu
ZCAxNCBkYXlzIGFnby4KClRoYW5rcyBmb3IgdGhlIHZlcnkgcHJlY2lzZSBjb3VudGluZywgdGhl
IGxhdHRlciBwYXJ0IHdoaWNoIHdpbGwgYmUKd3JvbmcgLSBldmVuIGlmIGp1c3Qgc2xpZ2h0bHkg
LSBieSB0aGUgdGltZSB5b3UgY29tbWl0IGl0IDstKQoKPiBOZXZlcnRoZWxlc3MgYXBwYXJlbnRs
eSBzb21lIHBlb3BsZSBhcmUgdHJ5aW5nIHRvIGJ1aWxkIFhlbiBvbiBzeXN0ZW1zCj4gd2hvc2Ug
a2VybmVsIGhlYWRlcnMgYXJlIHRoYXQgb2xkLiAgUGxhY2F0ZSB0aGVzZSBwZW9wbGUgYnkgcHJv
dmlkaW5nCj4gYSBmYWxsYmFjayAjZGVmaW5lIGZvciBDTE9ORV9ORVdJUEMuCj4gCj4gVGhlIGFj
dHVhbCBiaW5hcnkgdmFsdWUgd2lsbCBvZiBjb3Vyc2UgcmVtYWluIGNvbnN0YW50LCBiZWNhdXNl
IG9mIHRoZQo+IGtlcm5lbCBBUEkgcHJvbWlzZSwgc28gdGhpcyBpcyBhbmQgd2lsbCBiZSBjb3Jy
ZWN0IG9uIGFsbCBwbGF0Zm9ybXMKPiB3aGVyZSB0aGUgQ0xPTkVfTkVXSVBDIGlzIHN1cHBvcnRl
ZC4gIChFdmVuIGlmIGZvciBzb21lIHJlYXNvbiB3ZSBtaXNzCj4gdGhlIHJpZ2h0ICNpbmNsdWRl
cy4pCj4gCj4gT2YgY291cnNlIGF0IHJ1bnRpbWUgdGhpcyB2YWx1ZSB3aWxsIG5vdCB3b3JrIG9u
IG9sZGVyIGtlcm5lbHMuICBJdAo+IHdpbGwgYmUgcmVqZWN0ZWQgYXMgdW5rbm93bi4KClNhZGx5
IHRoZSBzaXR1YXRpb24gaXMgbW9yZSBjb21wbGljYXRlZDogVGhlIGNoZWNrIHRvIGRpc2FsbG93
CnVua25vd24gZmxhZ3Mgd2FzIGludHJvZHVjZWQgb25seSBpbiAyLjYuMTcgWzFdLCBhbmQgYXBw
YXJlbnRseQpuZXZlciBiYWNrcG9ydGVkIHRvIDIuNi4xNiBvciBvbGRlciBzdGFibGUgdHJlZXMg
ZGVzcGl0ZSB0aGUKZGVzY3JpcHRpb24gdGFsa2luZyBhYm91dCBpdCBnb2luZyBpbnRvIDIuNi4x
Ni4gU2luY2UgaXQgZGlkbid0Cm1hdHRlciBpbiBteSB2YXJpYW50IG9mIHRoZSB3b3JrYXJvdW5k
LCBJIGRpZG4ndCBtZW50aW9uIHRoaXMuCgpPZiBjb3Vyc2UgYSBwcmV0dHkgcmVhc29uYWJsZSBw
b3NpdGlvbiB0byB0YWtlIHdvdWxkIGJlIHRvCmNvbnNpZGVyIHRoZSAyLjYuMTgtYmFzZWQgWGVu
b0xpbnV4IHRyZWUgYSAiYmFzZWxpbmUiLCBiZXlvbmQKd2hpY2ggd2UgZG9uJ3QgY2FyZSBhYm91
dCB1bmRlc2lyYWJsZSBiZWhhdmlvciBoZXJlLgoKSmFuCgpbMV0gMDZmOWQ0Zjk0YSB1bnNoYXJl
OiBFcnJvciBpZiBwYXNzZWQgdW5zdXBwb3J0ZWQgZmxhZ3MKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
