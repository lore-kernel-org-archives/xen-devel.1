Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D488FCA178
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 19:28:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249687.1547129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzgH7-00004z-WB; Mon, 09 Mar 2026 19:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249687.1547129; Mon, 09 Mar 2026 19:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzgH7-00004s-SG; Mon, 09 Mar 2026 19:28:21 +0000
Received: by outflank-mailman (input) for mailman id 1249687;
 Mon, 09 Mar 2026 19:28:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vz3/=BJ=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vzgH6-0008WS-HU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 19:28:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ef7f47d-1bee-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 20:28:17 +0100 (CET)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-giO3XCGYORep7-RwVSzZzA-1; Mon, 09 Mar 2026 15:28:14 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89a17ec1eecso385620426d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 12:28:13 -0700 (PDT)
Received: from x1.local ([174.91.117.149]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a57c21650sm3965026d6.39.2026.03.09.12.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 12:28:11 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1ef7f47d-1bee-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773084495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbgWYjkthYIOSTddrLM7TxbryCIauGeCCATpvk8Vcjo=;
	b=OTbtKYNx9U1VSvr/q62NqwK7FMPTsE6CvsDNi5S+iSABv8gqXhhdui29gq63rhcMwgYQmr
	js8YOA0a3oDzDOs+vxlljPka3w7ljabdxDTQtZ2O6CVG5H3WsRHeo+G+nklz6IoYTGQA9T
	NCMs60r3qGpKp+n/+Zine4bMrEftPT8=
X-MC-Unique: giO3XCGYORep7-RwVSzZzA-1
X-Mimecast-MFC-AGG-ID: giO3XCGYORep7-RwVSzZzA_1773084493
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773084493; x=1773689293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbgWYjkthYIOSTddrLM7TxbryCIauGeCCATpvk8Vcjo=;
        b=I+HOOdZ4CcSwK0vbuFPPj7igZt1VDfWTGGX+AQcULAlMhPEWT3OXqYflmFMxFOT8U9
         VivaCfAeRLFrjfcdl8KTc6sWYz9xicYSAGT0veftY4slANf5RaLFpYJ7B7ig3E8QIvtR
         ByWfBiOJYkPmQrT/F1yyK/30y/wMatYjUVEPKAEep9bdOpSr1ohKnwRLjKkPRWivekpi
         HzdcsT1fyBIMZs9MMu/ObjvWV/twvW9Vmg9hI58JepVaogWv/4OTaiC48U8tAwwFzIhc
         rY26FW3HDM6BqxHPeUB6sPdUpGl3y7S04O28YePpF8jujNg2TVdxfzfGSD4oeqkd4lSh
         kVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRnkpE5Nbtp7VkjYeZGivrez14syg+q4yGC1bTL14yL8Q/C0jJEKlYHHo7dkwCZ1uIp1dbl9SkFTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5N46SVB87E0NfGCLw6IIbWlET9tmDlvPPVTnezEq5q3UY0+GC
	VNGOsU1llS3EQWYdHKC43c2dvgBPkx5o7pFrnCyYKFZAyfUIxtE1mZUBhc0ah4ji9nKpydWrNuH
	rihcbz8qXVnuJvGkS5X4ycGP8D+oUztnmpMJv/HnhFgDulaVvpZkCV/t/PEBde76i/3SI
X-Gm-Gg: ATEYQzzCXfLxZvwwq4cD3n8lCmu4a2FBeCRj7y9lO+bWKCCPLP7HPS3K7yG29jEklpL
	KpWka3g5MBnskSHG+cNQzCz3uUvaydMbP9sx3uoCbD2Av6ttA6Vhsw8Nuawn1BQfHxiVIPwC8vg
	6DRtMgVVpwbAS3AROYpk4m8Dzs9S7/MeezFZ18BtvT8I51JCmy50Yo/5JYU5agedyKbsVpHWAh1
	1j/PL0xKOrYwt0NvGacWzxhfI+sNMcFrQcotAWzpaTUC1kJ8rAhwgT41pg9O0GUR2QoqLFlJYGO
	7I7j9zAN/C4RrH7NiGud+gXOe33N5Aah6Vz8kqX08yxGnrpjGTx/qszMGy7g/lKTCgYL8kI1wFJ
	q5X0CUkH8WQHXLg==
X-Received: by 2002:a05:6214:cc4:b0:89a:865:75d7 with SMTP id 6a1803df08f44-89a30a5c913mr195502306d6.27.1773084493136;
        Mon, 09 Mar 2026 12:28:13 -0700 (PDT)
X-Received: by 2002:a05:6214:cc4:b0:89a:865:75d7 with SMTP id 6a1803df08f44-89a30a5c913mr195501746d6.27.1773084492577;
        Mon, 09 Mar 2026 12:28:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 15:28:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: Re: [PATCH v2 0/4] system/memory: Constify various
 RAMBlock/MemoryRegion arguments
Message-ID: <aa8fQIialE5xMAnf@x1.local>
References: <20260309183536.88976-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260309183536.88976-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mkQdIm1VSr7gb2jADLY9uz5gmDZdWzhCynGKUdVAxgo_1773084493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 09, 2026 at 07:35:31PM +0100, Philippe Mathieu-Daudé wrote:
> v2:
> - Dropped "stubs: Merge physmem.c within ram-block.c" (Zoltan)
> - Dropped "info mtree" patches (no time to update doc for freeze)
> - New Xen patch
> 
> Philippe Mathieu-Daudé (4):
>   system/ramblock: Constify various RAMBlock arguments
>   system/memory: Constify various MemoryRegion arguments
>   system/xen: Constify various MemoryRegion arguments
>   system/memory: Have memory_region_type() correctly describe containers

queued

-- 
Peter Xu


